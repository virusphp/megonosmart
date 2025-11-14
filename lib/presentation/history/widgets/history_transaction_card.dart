import 'package:flutter/material.dart';
import 'package:megonopos/core/components/buttons.dart';
import 'package:megonopos/core/extentions/int_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/dataoutputs/cwb_print.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/constants/colors.dart';
import '../../../data/datasources/product_local_datasource.dart';

class HistoryTransactionCard extends StatelessWidget {
  final OrderModel data;
  final EdgeInsetsGeometry? padding;

  const HistoryTransactionCard({
    super.key,
    required this.data,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 48.0,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0,
            color: AppColors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(0.0),
        ),
        title: Row(
          children: [
            Assets.icons.payments.svg(),
            const SizedBox(width: 5.0),
            Text(
              '${data.transactionTime.toFormattedTimeOnly} - ${data.paymentMethod == 'QRIS' ? 'QRIS' : 'Cash'}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              data.totalPrice.currencyFormatRp,
              style: const TextStyle(
                color: AppColors.green,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.orders.length + 1,
            itemBuilder: (context, index) {
              if (index == data.orders.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 8.0), // Padding diperkecil
                  child: Row(
                    children: [
                      // Button.filled(
                      //   onPressed: () async {
                      //     // print receipt
                      //     final printInt = await CwbPrint.instance.printOrderV2(
                      //       data.orders,
                      //       data.totalQuantity,
                      //       data.totalPrice,
                      //       data.paymentMethod,
                      //       data.nominalBayar,
                      //       data.namaKasir,
                      //       'Customer',
                      //     );
                      //     CwbPrint.instance.printReceipt(printInt);
                      //   },
                      //   label: 'Print Receipt',
                      //   icon: const Icon(Icons.print),
                      // ),
                      ElevatedButton(
                        onPressed: () async {
                          // dialog konfirmasi delete
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm Delete'),
                              content: const Text(
                                  'Yakin ingin menghapus data order ini?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    //delete order
                                    ProductLocalDatasource.instance
                                        .removeOrderById(data.id!);
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Order deleted successfully'),
                              ),
                            );
                            Navigator.of(context).pop();
                          } else {
                            return;
                          }
                        },
                        child: Row(children: [
                          const Icon(Icons.delete),
                          const SizedBox(width: 5.0),
                          Text('Delete Order'.toUpperCase()),
                        ]),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          // print receipt
                          final printInt = await CwbPrint.instance.printOrderV2(
                            data.orders,
                            data.totalQuantity,
                            data.totalPrice,
                            data.paymentMethod,
                            data.nominalBayar,
                            data.namaKasir,
                            'Customer',
                          );
                          CwbPrint.instance.printReceipt(printInt);
                        },
                        child: Row(children: [
                          const Icon(Icons.print),
                          const SizedBox(width: 5.0),
                          Text('Print Receipt'.toUpperCase()),
                        ]),
                      ),
                    ],
                  ),
                );
              }
              final item = data.orders[index];
              return ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                title: Text(
                  item.product.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '${item.quantity} x ${item.product.price.currencyFormatRp}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  '${item.quantity * item.product.price}'.currencyFormatRp,
                  style: const TextStyle(
                    color: AppColors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
