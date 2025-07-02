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
            paymentMethod: order.paymentMethod,
            orderItems: orderItems
            );
        final response = await orderRemoteDatasource.sendOrder(orderRequest);
        if (response) {
          await ProductLocalDatasource.instance
              .updateIsSyncOrderById(order.id!);
        }
      }
      emit(const SyncOrderState.success());
    });

    on<_SendOrderForCloseChasier>((event, emit) async {
      emit(const _Loading());
      //get ordres from local isSync is 1
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
            );
        final response = await orderRemoteDatasource.sendOrder(orderRequest);
        if (response) {
          await ProductLocalDatasource.instance
              .updateIsSyncOrderById(order.id!);
        }
      }
      emit(const SyncOrderState.successForCloseChasier());
    });
  }


}
