part of 'draft_order_bloc.dart';

@freezed
class DraftOrderEvent with _$DraftOrderEvent {
  const factory DraftOrderEvent.started() = _Started;

  //getAllDraftOrder
  const factory DraftOrderEvent.getAllDraftOrder() = _GetAllDraftOrder;
}
