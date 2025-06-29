part of 'close_cashier_bloc.dart';

@freezed
class CloseCashierEvent with _$CloseCashierEvent {
  const factory CloseCashierEvent.started() = _Started;
  const factory CloseCashierEvent.closeCashier() = _CloseCashier;
}