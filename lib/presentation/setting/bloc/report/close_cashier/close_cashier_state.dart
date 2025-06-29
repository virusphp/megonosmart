part of 'close_cashier_bloc.dart';

@freezed
class CloseCashierState with _$CloseCashierState {
  const factory CloseCashierState.initial() = _Initial;
  const factory CloseCashierState.loading() = _Loading;
  const factory CloseCashierState.success() = _Success;
  const factory CloseCashierState.error(String message) = _Error;
}
