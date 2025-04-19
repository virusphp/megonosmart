import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/report_remote_datasource.dart';
import 'package:megonopos/data/models/response/product_sales_report_model.dart';

part 'product_sales_event.dart';
part 'product_sales_state.dart';
part 'product_sales_bloc.freezed.dart';

class ProductSalesBloc extends Bloc<ProductSalesEvent, ProductSalesState> {
  final ReportRemoteDataSource reportRemoteDataSource;
  ProductSalesBloc(
    this.reportRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetProductSales>((event, emit) async{
      emit(const _Loading());
      final result = await ReportRemoteDataSource().getProductSalesReport(event.startDate, event.endDate);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );  
    });
  }
}
