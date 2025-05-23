import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/presentation/home/models/order_item.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const _Success([], 0, 0, '', 0, 0, '', '')) {
    on<_AddPaymentMethod>((event, emit) async {
      emit(const _Loading());
      final userData = await AuthLocalDatasource().getAuthData();
      emit(_Success(
        event.orders,
        event.orders.fold(
            0, (previousValue, element) => previousValue + element.quantity),
        event.orders.fold(
            0,
            (previousValue, element) =>
                previousValue + (element.quantity * element.product.price)),
        event.paymentMethod,
        0,
        userData.result!.user.id,
        userData.result!.user.name,
        event.customerName,
      ));
    });

    on<_AddNominalBayar>((event, emit) {
      var currentStates = state as _Success;
      emit(const _Loading());

      emit(_Success(
        currentStates.products,
        currentStates.totalQuantity,
        currentStates.totalPrice,
        currentStates.paymentMethod,
        event.nominal,
        currentStates.idKasir,
        currentStates.namaKasir,
        currentStates.customerName,
      ));
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success([], 0, 0, '', 0, 0, '', ''));
    });
  }
}
