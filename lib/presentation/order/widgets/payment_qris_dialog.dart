import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/data/dataoutputs/cwb_print.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/order/bloc/order/order_bloc.dart';
import 'package:megonopos/presentation/order/bloc/qris/qris_bloc.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';
import 'package:megonopos/presentation/order/widgets/payment_success_dialog.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../../../core/constants/colors.dart';

class PaymentQrisDialog extends StatefulWidget {
  final int price;
  const PaymentQrisDialog({
    super.key,
    required this.price,
  });

  @override
  State<PaymentQrisDialog> createState() => _PaymentQrisDialogState();
}

class _PaymentQrisDialogState extends State<PaymentQrisDialog> {
  String orderId = '';
  Timer? timer;

  WidgetsToImageController controller = WidgetsToImageController();

  @override
  void initState() {
    orderId = DateTime.now().millisecondsSinceEpoch.toString();
    context.read<QrisBloc>().add(QrisEvent.generateQRCode(
          orderId,
          widget.price,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.primary,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pembayaran QRIS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SpaceHeight(6.0),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (data, qty, total, paymentMethod, nominal, idKasir,
                  namaKasir, customerName) {
                return Container(
                  width: context.deviceWidth,
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocListener<QrisBloc, QrisState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {
                              return;
                            },
                            qrisResponse: (data) {
                              const onSec = Duration(seconds: 5);
                              timer = Timer.periodic(onSec, (timer) {
                                context
                                    .read<QrisBloc>()
                                    .add(QrisEvent.checkPaymentStatus(orderId));
                              });
                            },
                            success: (message) {
                              timer?.cancel();
                              final orderModel = OrderModel(
                                  paymentMethod: paymentMethod,
                                  nominalBayar: total,
                                  orders: data,
                                  totalQuantity: qty,
                                  totalPrice: total,
                                  idKasir: idKasir,
                                  namaKasir: namaKasir,
                                  transactionTime:
                                      DateFormat('yyyy-MM-ddTHH:mm:ss')
                                          .format(DateTime.now()),
                                  isSync: false);
                              ProductLocalDatasource.instance
                                  .saveOrder(orderModel);
                              context.pop();
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const PaymentSuccessDialog(),
                              );
                            },
                          );
                        },
                        child: BlocBuilder<QrisBloc, QrisState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return const SizedBox();
                              },
                              qrisResponse: (data) {
                                return WidgetsToImage(
                                  controller: controller,
                                  child: Container(
                                    width: 256.0,
                                    height: 256.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Image.network(
                                        data.actions!.first.url!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              loading: () {
                                return Container(
                                  width: 256.0,
                                  height: 256.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white,
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SpaceHeight(5.0),
                      const Text(
                        'Scan QRIS untuk melakukan pembayaran',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SpaceHeight(16),
                      ElevatedButton(
                          onPressed: () async {
                            final bytes = await controller.capture();
                            final listInt = await CwbPrint.instance
                                .printQRIS(total, bytes!);
                            CwbPrint.instance.printReceipt(listInt);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),  
                          ),
                          child: const Text(
                            'Print QRIS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
