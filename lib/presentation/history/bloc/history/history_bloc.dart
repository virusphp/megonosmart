import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const HistoryState.loading());
      final data = await ProductLocalDatasource.instance.getAllOrder();
      emit(HistoryState.success(data));
    });

    on<_GetHistoryReport>((event, emit) async {
      emit(const _Loading());
      final result = await ProductLocalDatasource.instance.getOrderByDate(event.date);
       emit(HistoryState.success(result));
      // result.fold(
      //   (l) => emit(_Error("Failed")),
      //   (r) => emit(_Success(r))
      // );
    });
  }
}
