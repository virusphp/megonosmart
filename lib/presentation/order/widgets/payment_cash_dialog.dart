import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/core/extentions/int_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/order/bloc/order/order_bloc.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';
import 'package:megonopos/presentation/order/widgets/payment_success_dialog.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class PaymentCashDialog extends StatefulWidget {
  final int price;
  const PaymentCashDialog({super.key, required this.price});

  @override
  State<PaymentCashDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends State<PaymentCashDialog> {
  TextEditingController?
      priceController; // = TextEditingController(text: widget.price.currencyFormatRp);
    String? errorMessage;

  @override
  void initState() {
    priceController =
        TextEditingController(text: widget.price.currencyFormatRp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Stack(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.highlight_off),
            color: AppColors.primary,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Pembayaran - Tunai',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Total Pembayaran',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              ),
          ),
          const SpaceHeight(4.0),
          Center(
            child: Text(
              widget.price.currencyFormatRp,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SpaceHeight(16.0),
          if (errorMessage != null) ...[
            Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
            const SpaceHeight(8.0),
          ],
          CustomTextField(
            controller: priceController!,
            label: 'Nominal Pembayaran',
            // showLabel: false,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final int priceValue = value.toIntegerFromText;
              priceController!.text = priceValue.currencyFormatRp;
              priceController!.selection = TextSelection.fromPosition(
                  TextPosition(offset: priceController!.text.length));
            },
          ),
          const SpaceHeight(16.0),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Button.filled(
                      onPressed: () {
                        // Set the priceController text to the exact price (uang pas)
                        priceController!.text = widget.price.currencyFormatRp;
                        priceController!.selection = TextSelection.fromPosition(
                          TextPosition(offset: priceController!.text.length),
                        );
                      },
                      label: 'Uang Pas',
                      textColor: AppColors.primary,
                      fontSize: 13.0,
                      width: 112.0,
                      height: 30.0,
                    ),
                  ),
                ],
              ),
              const SpaceHeight(10.0),
              Row(
                children: [
                  Expanded(
                    child: Button.filled(
                        onPressed: () {
                             // Set the priceController text to the exact price (uang pas)
                          priceController!.text =  "Rp. 50.000";
                          priceController!.selection = TextSelection.fromPosition(
                            TextPosition(offset: priceController!.text.length),
                          );
                        },
                        label: "Rp. 50.000",
                        textColor: AppColors.primary,
                        fontSize: 13.0,
                        height: 30.0,
                    ),
                  ),
                  const SpaceWidth(5.0),
                   Expanded(
                    child: Button.filled(
                        onPressed: () {
                                // Set the priceController text to the exact price (uang pas)
                          priceController!.text =  "Rp. 100.000";
                          priceController!.selection = TextSelection.fromPosition(
                            TextPosition(offset: priceController!.text.length),
                          );
                        },
                        label: "Rp. 100.000",
                        textColor: AppColors.primary,
                        fontSize: 13.0,
                        height: 30.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SpaceHeight(16.0),
          BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data, qty, total, payment, nominal, idKasir,
                    namaKasir, customerName) {
                  final orderModel = OrderModel(
                      paymentMethod: payment,
                      nominalBayar: nominal,
                      orders: data,
                      totalQuantity: qty,
                      totalPrice: total,
                      idKasir: idKasir,
                      namaKasir: namaKasir,
                      transactionTime: DateFormat('yyyy-MM-ddTHH:mm:ss')
                          .format(DateTime.now()),
                      isSync: false);
                  ProductLocalDatasource.instance.saveOrder(orderModel);
                  context.pop();
                  showDialog(
                    context: context,
                    builder: (context) => const PaymentSuccessDialog(),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const SizedBox();
              }, success: (data, qty, total, payment, _, idKasir, mamaKasir,
                  customerName) {
                return Button.filled(
                    onPressed: () {
                    final bayar = priceController!.text.toIntegerFromText;
                      if (bayar < widget.price) {
                        setState(() {
                          errorMessage = 'Nominal pembayaran kurang dari total harga.';
                        });
                        return;
                      }
                    context.read<OrderBloc>().add(OrderEvent.addNominalBayar(
                        bayar,
                      ));
                    },
                  label: 'Proses',
                );
              }, error: (message) {
                return const SizedBox();
              });
            },
          ),
        ],
      ),
    );
  }
}
