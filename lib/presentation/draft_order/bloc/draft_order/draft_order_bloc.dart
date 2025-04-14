import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/order/models/draft_order_model.dart';

part 'draft_order_event.dart';
part 'draft_order_state.dart';
part 'draft_order_bloc.freezed.dart';

class DraftOrderBloc extends Bloc<DraftOrderEvent, DraftOrderState> {
  final ProductLocalDatasource _productLocalDatasource;
  DraftOrderBloc(
    this._productLocalDatasource,
  ) : super(const _Initial()) {
    on<_GetAllDraftOrder>((event, emit) async {
      emit(const _Loading());
      final data = await _productLocalDatasource.getAllDraftOrder();
      // print(data);
      emit(DraftOrderState.success(data));
    });
  }
}
