import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/data/models/response/product_response_model.dart';
import 'package:megonopos/presentation/home/models/draft_order_item.dart';
import 'package:megonopos/presentation/home/models/order_item.dart';
import 'package:megonopos/presentation/order/models/draft_order_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Success([], 0, 0, "customer")) {
    on<_AddCheckout>((event, emit) {
      //final
      var currentStates = state as _Success;
      List<OrderItem> newCheckout = [...currentStates.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        newCheckout[index].quantity++;
      } else {
        newCheckout.add(OrderItem(product: event.product, quantity: 1));
      }

      int totalQuantity = newCheckout.fold(
          0, (previousValue, element) => previousValue + element.quantity);
      int totalPrice = newCheckout.fold(
          0,
          (previousValue, element) =>
              previousValue + (element.product.price * element.quantity));

      emit(_Success(newCheckout, totalQuantity, totalPrice, currentStates.draftName));
    });

    on<_RemoveCheckout>((event, emit) {
      var currentStates = state as _Success;
      List<OrderItem> newCheckout = [...currentStates.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        if (newCheckout[index].quantity > 1) {
          newCheckout[index].quantity--;
        } else {
          newCheckout.removeAt(index);
        }
      }

      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += (element.product.price * element.quantity);
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice , currentStates.draftName));
    });

    //remove product
    on<_RemoveProduct>((event, emit) {
      var currentState = state as _Success;
      List<OrderItem> newCheckout = [...currentState.products];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        newCheckout.removeAt(index);
      }

      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += (element.product.price * element.quantity);
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice, currentState.draftName));
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success([], 0, 0, "customer"));
    });
    
    on<_SaveDraftOrder>((event, emit) {
      var currentState = state as _Success;
      emit(const _Loading());

      final draftOrder = DraftOrderModel(
        orders: currentState.products.map((e) => 
              DraftOrderItem(
                product: e.product, 
                quantity: e.quantity,
                )).toList(),
        totalQuantity: currentState.totalQuantity, 
        totalPrice: currentState.totalPrice, 
        transactionTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        tableNumber: event.tableNumber, 
        draftName: event.draftName,
      );
      ProductLocalDatasource.instance.saveDraftOrder(draftOrder);
      emit(const _SavedDraftOrder());

    });
  }
}
