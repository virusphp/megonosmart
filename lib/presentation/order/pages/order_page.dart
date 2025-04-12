import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/assets/assets.gen.dart';
import 'package:megonopos/core/components/buttons.dart';
import 'package:megonopos/core/components/menu_button.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/dataoutputs/cwb_print.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:megonopos/presentation/home/models/order_item.dart';
import 'package:megonopos/presentation/home/pages/dashboard_page.dart';
import 'package:megonopos/presentation/order/bloc/order/order_bloc.dart';
import 'package:megonopos/presentation/order/widgets/order_card.dart';
import 'package:megonopos/presentation/order/widgets/payment_cash_dialog.dart';
import 'package:megonopos/presentation/order/widgets/payment_qris_dialog.dart';
import 'package:megonopos/presentation/order/widgets/process_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final indexValue = ValueNotifier(0);
  final TextEditingController orderNameController = TextEditingController();
  final TextEditingController tableNumberController = TextEditingController();

  List<OrderItem> orders = [];
  int totalPrice = 0;
  int calculateTotalPrice(List<OrderItem> orders) {
    return orders.fold(
        0,
        (previousValue, element) =>
            previousValue + element.product.price * element.quantity);
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.push(const DashboardPage());
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Order Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Open Bill"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Table Number',
                          ),
                          keyboardType: TextInputType.number,
                          controller: tableNumberController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Order Name',
                          ),
                          controller: orderNameController,
                          textCapitalization: TextCapitalization.words,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      BlocBuilder<CheckoutBloc, CheckoutState>(
                        builder: (context, state) {
                          return state.maybeWhen(orElse: () {
                            return SizedBox.shrink();
                          }, success: (data, qty, total, draftName) {
                            return Button.outlined(
                              onPressed: () async {
                                final authData =
                                    await AuthLocalDatasource().getAuthData();

                                context.read<CheckoutBloc>().add(
                                      CheckoutEvent.saveDraftOrder(
                                          tableNumberController
                                              .text.toIntegerFromText,
                                          orderNameController.text),
                                    );

                                final printInt =
                                    await CwbPrint.instance.printChecker(
                                  data,
                                  tableNumberController.text.toInt,
                                  orderNameController.text,
                                  authData.result!.user.name,
                                );

                                // CwbPrint.instance.printReceipt(printInt);

                                context
                                    .read<CheckoutBloc>()
                                    .add(const CheckoutEvent.started());

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Save draft app"),
                                    backgroundColor: AppColors.darkYellow,
                                  ),
                                );

                                context.pushReplacement(const DashboardPage());
                              },
                              label: 'Save & Print',
                              fontSize: 14,
                              height: 40,
                              width: 140,
                            );
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.save_as_outlined),
          ),
        ],
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text("No data"),
              );
            },
            success: (data, qty, total, customer) {
              if (data.isEmpty) {
                return const Center(
                  child: Text("No data"),
                );
              }
              // orders = data;
              totalPrice = total;
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemCount: data.length,
                separatorBuilder: (context, index) => const SpaceHeight(20.0),
                itemBuilder: (context, index) => OrderCard(
                  padding: paddingHorizontal,
                  data: data[index],
                  onDeleteTap: () {
                    context
                        .read<CheckoutBloc>()
                        .add(CheckoutEvent.removeProduct(data[index].product));
                    // indexValue = 0;
                    // orders.removeAt(index);
                    // setState(() {});
                  },
                ),
              );
            },
          );
          //
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                  success: (data, qty, total, draftName) {
                    return ValueListenableBuilder(
                      valueListenable: indexValue,
                      builder: (context, value, _) => Row(
                        children: [
                          const SpaceWidth(10.0),
                          Flexible(
                            child: MenuButton(
                              iconPath: Assets.icons.cash.path,
                              label: 'TUNAI',
                              isActive: value == 1,
                              onPressed: () {
                                indexValue.value = 1;
                                context.read<OrderBloc>().add(
                                    OrderEvent.addPaymentMethod(
                                        'Tunai', data, draftName));
                              },
                            ),
                          ),
                          const SpaceWidth(10.0),
                          Flexible(
                            child: MenuButton(
                                iconPath: Assets.icons.qrCode.path,
                                label: 'QRIS',
                                isActive: value == 2,
                                onPressed: () {
                                  indexValue.value = 2;
                                  context.read<OrderBloc>().add(
                                      OrderEvent.addPaymentMethod(
                                          'QRIS', data, draftName));
                                }),
                          ),
                          Flexible(
                            child: MenuButton(
                                iconPath: Assets.icons.debit.path,
                                label: 'TRANSFER',
                                isActive: value == 3,
                                onPressed: () {
                                  indexValue.value = 3;
                                }),
                          ),
                          const SpaceWidth(10.0),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SpaceHeight(20.0),
            ProcessButton(
              price: 0,
              onPressed: () async {
                if (indexValue.value == 0) {
                } else if (indexValue.value == 1) {
                  showDialog(
                    context: context,
                    builder: (context) => PaymentCashDialog(
                      price: totalPrice,
                    ),
                  );
                } else if (indexValue.value == 2) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => PaymentQrisDialog(
                      price: totalPrice,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
