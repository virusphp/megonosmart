part of 'draft_order_bloc.dart';

@freezed
class DraftOrderState with _$DraftOrderState {
  const factory DraftOrderState.initial() = _Initial;

  const factory DraftOrderState.loading() = _Loading;

  const factory DraftOrderState.success(List<DraftOrderModel> draftOrders) =
      _Success;

  const factory DraftOrderState.error(String message) = _Error;
}
