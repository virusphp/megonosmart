part of 'sync_order_bloc.dart';

@freezed
class SyncOrderEvent with _$SyncOrderEvent {
  const factory SyncOrderEvent.started() = _Started;
  //sendOrder
  const factory SyncOrderEvent.sendOrder() = _SendOrder;
  const factory SyncOrderEvent.sendOrderForCloseChasier() = _SendOrderForCloseChasier;
}
