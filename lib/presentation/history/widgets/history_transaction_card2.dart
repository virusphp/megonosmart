import 'package:flutter/material.dart';
import 'package:megonopos/core/assets/assets.gen.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/int_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/dataoutputs/cwb_print.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';

import '../../../core/components/buttons.dart';

class HistoryTransactionCard extends StatelessWidget {
  final OrderModel data;
  final EdgeInsetsGeometry? padding;
  final Function(int id)? onDelete; // callback delete

  const HistoryTransactionCard({
    super.key,
    required this.data,
    this.padding,
    this.onDelete,
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
            color: AppColors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        key: PageStorageKey('history-${data.id}'),
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
          Column(
            children: [
              // List order items
              ...List.generate(
                data.orders.length,
                (index) {
                  final item = data.orders[index];
                  return ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    minLeadingWidth: 0.0,
                    minVerticalPadding: 0.0,
                    title: Text(
                      item.product.name,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      '${item.quantity} x ${item.product.price.currencyFormatRp}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      '${item.quantity * item.product.price}'.currencyFormatRp,
                      style: const TextStyle(
                        color: AppColors.green,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              ),

              // Buttons (Delete & Print)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button.filled(
                      width: 180.0,
                      height: 40.0,
                      onPressed: () async {
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
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true && onDelete != null) {
                          onDelete!(data.id!);
                        }
                      },
                      label: 'Delete',
                      icon: const Icon(Icons.delete, color: AppColors.white),
                    ),
                    Button.filled(
                      width: 180.0,
                      height: 40.0,
                      onPressed: () async {
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
                      label: 'Print Receipt',
                      icon: const Icon(Icons.print, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
