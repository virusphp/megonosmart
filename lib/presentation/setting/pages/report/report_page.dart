import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import 'package:intl/intl.dart';
import 'package:megonopos/core/components/buttons.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/int_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/models/response/product_sales_report_model.dart';
import 'package:megonopos/data/models/response/summary_response_model.dart';
import 'package:megonopos/presentation/setting/bloc/report/product_sales/product_sales_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/report/summary/summary_bloc.dart';

import 'utils/helper_pdf_service.dart';
import 'utils/invoice.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  DateTime selectedStartDate = DateTime.now().subtract(const Duration(days: 1));
  DateTime selectedEndDate = DateTime.now();

  List<ProductSale> productSales = [];
  Summary? summary;

  @override
  void initState() {
    super.initState();
    String startDate = DateFormat('yyyy-MM-dd').format(selectedStartDate);
    String endDate = DateFormat('yyyy-MM-dd').format(selectedEndDate);
    context
        .read<SummaryBloc>()
        .add(SummaryEvent.getSummary(startDate, endDate));
    context
        .read<ProductSalesBloc>()
        .add(ProductSalesEvent.getProductSales(startDate, endDate));
  }

  Future<void> _selectStartDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Report"),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'PDF') {
                  log("PDF");
                  if (productSales.isNotEmpty && summary != null) {
                    // final status = await PermessionHelper().checkPermission();
                    // if (status.isGranted) {
                    final pdfFile =
                        await Invoice.generate(productSales, summary!);
                    log("pdfFile: $pdfFile");
                    HelperPdfService.openFile(pdfFile);
                    // }
                  }
                }
              },
              itemBuilder: (BuildContext context) {
                return {'PDF'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              icon: const Icon(Icons.more_vert, color: AppColors.primary),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          selectedStartDate == null
                              ? ''
                              : DateFormat('dd MMM yyyy').format(
                                  selectedStartDate,
                                ),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.0,
                          ),
                        ),
                        IconButton(
                            onPressed: () => _selectStartDate(context),
                            icon: const Icon(Icons.calendar_month,
                                color: AppColors.primary)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          selectedEndDate == null
                              ? ''
                              : DateFormat('dd MMM yyyy').format(
                                  selectedEndDate,
                                ),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12.0,
                          ),
                        ),
                        IconButton(
                            onPressed: () => _selectEndDate(context),
                            icon: const Icon(Icons.calendar_month,
                                color: AppColors.primary)),
                      ],
                    ),
                    const SpaceWidth(4),
                    Expanded(
                      child: Button.filled(
                          onPressed: () {
                            String startDate = DateFormat('yyyy-MM-dd')
                                .format(selectedStartDate);
                            String endDate = DateFormat('yyyy-MM-dd')
                                .format(selectedEndDate);
                            context.read<SummaryBloc>().add(
                                SummaryEvent.getSummary(startDate, endDate));
                            context.read<ProductSalesBloc>().add(
                                ProductSalesEvent.getProductSales(
                                    startDate, endDate));
                          },
                          label: "Filter"),
                    ),
                  ],
                ),
                const SpaceHeight(16.0),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.card.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Summary Report',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SpaceHeight(16.0),
                        BlocBuilder<SummaryBloc, SummaryState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                              success: (data) {
                                summary = data.result!.summary;
                                return Column(
                                  children: [
                                    buildPrice('Total Revenue',
                                        data.result!.summary!.totalRevenue.toString()),
                                    const SpaceHeight(8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Sold Items",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                            "${data.result!.summary!.totalSoldQuantity} items",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary)),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )),
                const SpaceHeight(16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.card.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Product Sales',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SpaceHeight(16.0),
                      BlocBuilder<ProductSalesBloc, ProductSalesState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            success: (data) {
                              productSales = data.result!.productSales!.toList();
                              int totalQty = 0;
                              int totalPrice = 0;
                              for (var element in data.result!.productSales!) {
                                totalPrice +=
                                    element.totalPrice!;
                                totalQty +=
                                    element.totalQuantity!.toIntegerFromText;
                              }
                              return Column(
                                children: [
                                  tableProductSales(data),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Total",
                                          style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "$totalQty",
                                          style: const TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SpaceWidth(24),
                                        Text(
                                          "$totalPrice".toString().currencyFormatRp,
                                          style: const TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                              // return Text("text");
                            },
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildPrice(
    String title,
    String value,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.primary,
          ),
        ),
        Text(int.parse(value).currencyFormatRp,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primary)),
      ],
    );
  }

  List<Widget> _getTitleHeaderWidget() {
    return [
      _getTitleItemWidget('No', 58),
      _getTitleItemWidget('ID', 58),
      _getTitleItemWidget('Product', 140),
      _getTitleItemWidget('Price', 140),
      _getTitleItemWidget('Quantity', 58),
      _getTitleItemWidget('Total', 140),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      color: AppColors.primary,
      alignment: Alignment.centerLeft,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget tableProductSales(ProductSalesResponseModel data) {
    const double itemHeight = 55.0;
    final double tableHeight = itemHeight * data.result!.productSales!.length;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: tableHeight + itemHeight,
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 58,
          rightHandSideColumnWidth: 536,
          isFixedHeader: true,
          headerWidgets: _getTitleHeaderWidget(),
          leftSideItemBuilder: (context, index) {
            return Container(
              width: 58,
              height: 52,
              alignment: Alignment.centerLeft,
              child: Center(child: Text((index + 1).toString())),
            );
          },
          rightSideItemBuilder: (context, index) {
            final productSales = data.result!.productSales![index];
            return Row(
              children: <Widget>[
                Container(
                  width: 58,
                  height: 52,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text(
                    productSales.productId.toString(),
                  )),
                ),
                Container(
                  width: 140,
                  height: 52,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text(
                    productSales.productName.toString(),
                  )),
                ),
                Container(
                  width: 140,
                  height: 52,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text(
                    productSales.productPrice.toString().currencyFormatRp,
                  )),
                ),
                Container(
                  width: 58,
                  height: 52,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      productSales.totalQuantity.toString(),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 52,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      productSales
                          .totalPrice.toString().currencyFormatRp
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: data.result!.productSales!.length,
          rowSeparatorWidget: const Divider(
            color: AppColors.black,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: AppColors.white,
          rightHandSideColBackgroundColor: AppColors.white,
          itemExtent: 55,
        ),
      ),
    );
  }
}
