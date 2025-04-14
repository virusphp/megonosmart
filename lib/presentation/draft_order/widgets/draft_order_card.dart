import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/core/extentions/int_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:megonopos/presentation/order/pages/order_page.dart';

import '../../../core/components/buttons.dart';
import '../../../core/constants/colors.dart';
import '../../order/models/draft_order_model.dart';

class DraftOrderCard extends StatelessWidget {
  final DraftOrderModel data;

  final EdgeInsetsGeometry? padding;

  const DraftOrderCard({
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
              const Icon(Icons.dining_outlined),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Table ${data.tableNumber} - ${data.draftName}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    data.totalPrice.currencyFormatRp,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Button.filled(
                onPressed: () {
                  context.read<CheckoutBloc>().add(
                        CheckoutEvent.loadDraftOrder(data),
                      );
                  context.push(const OrderPage());
                  ProductLocalDatasource.instance
                      .removeDraftOrderById(data.id!);
                },
                label: 'Pay',
                width: 80.0,
                height: 30.0,
                borderRadius: 8.0,
                fontSize: 12.0,
              ),
            ],
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.orders.length,
              itemBuilder: (context, index) {
                final item = data.orders[index];
                return ListTile(
                  title: Text(item.product.name),
                  subtitle: Text(
                    '${item.quantity} x ${item.product.price.currencyFormatRp}',
                  ),
                  trailing: Text(
                    '${item.quantity * item.product.price}'.currencyFormatRp,
                    style: const TextStyle(
                      color: AppColors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
