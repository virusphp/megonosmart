import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/report_remote_datasource.dart';
import 'package:megonopos/data/models/response/summary_response_model.dart';

part 'summary_event.dart';
part 'summary_state.dart';
part 'summary_bloc.freezed.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ReportRemoteDataSource reportRemoteDatasource;
  SummaryBloc(
    this.reportRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSummary>((event, emit) async{
      emit(const _Loading());
      final summary = await reportRemoteDatasource.getSummaryReport(
        event.startDate,
        event.endDate,
      );
      summary.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
