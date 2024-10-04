import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/order_remote_datasource.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/data/models/request/order_request_model.dart';

part 'sync_order_event.dart';
part 'sync_order_state.dart';
part 'sync_order_bloc.freezed.dart';

class SyncOrderBloc extends Bloc<SyncOrderEvent, SyncOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  SyncOrderBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_SendOrder>((event, emit) async {
      emit(const _Loading());
      //get ordres from local isSync is 0
      final ordersIsSyncZero =
          await ProductLocalDatasource.instance.getOrderByIsSync();
      for (var order in ordersIsSyncZero) {
        final orderItems = await ProductLocalDatasource.instance
            .getOrderItemByIdOrderLocal(order.id!);
        final orderRequest = OrderRequestModel(
            transactionTime: order.transactionTime,
            kasirId: order.idKasir,
            totalPrice: order.totalPrice,
            totalItem: order.totalQuantity,
            paymentMethod: order.paymentMethod == "Tunai" ? "cash" : "qris",
            orderItems: orderItems
            // .map(
            //   (e) => OrderItemModel(
            //     productId: e.productId,
            //     quantity: e.quantity,
            //     totalPrice: e.quantity * e.product.price,
            //   ),
            // )
            // .toList(),
            );
        final response = await orderRemoteDatasource.sendOrder(orderRequest);
        if (response) {
          await ProductLocalDatasource.instance
              .updateIsSyncOrderById(order.id!);
        }
      }
      emit(const SyncOrderState.success());
      // if (response) {
      //   emit(const SyncOrderState.success());
      // } else {
      //   emit(const SyncOrderState.error("Gagal syncron order"));
      // }
    });
  }
}
