import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/datasources/report_remote_datasource.dart';

part 'close_cashier_event.dart';
part 'close_cashier_state.dart';
part 'close_cashier_bloc.freezed.dart';

class CloseCashierBloc extends Bloc<CloseCashierEvent, CloseCashierState> {
  final ReportRemoteDataSource reportRemoteDataSource;

  CloseCashierBloc(
    this.reportRemoteDataSource
  ) : super(const _Initial()) {
    on<_CloseCashier>((event, emit) async {
      emit(const _Loading());
      final result = await reportRemoteDataSource.closeCashier();
      result.fold(
        (error) => emit(_Error(error)),
        (success) {
          AuthLocalDatasource().removeAuthData();
          emit(const _Success());
        } 
      );  
    });
  }
}
