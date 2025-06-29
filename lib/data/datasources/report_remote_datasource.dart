import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:megonopos/core/constants/variables.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/models/response/product_sales_report_model.dart'; // Ensure this file defines ProductSalesReportModel
import 'package:megonopos/data/models/response/summary_response_model.dart';

class ReportRemoteDataSource {
  // This class will handle
  Future<Either<String, SummaryResponseModel>> getSummaryReport(String startDate, String endDate) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse(
          '${Variables.baseUrl}/api/report/summary?start_date=$startDate&end_date=$endDate'
        ),
        headers: {
          'Authorization': 'Bearer ${authData.result?.token.toString()}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return Right(SummaryResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, ProductSalesResponseModel>> getProductSalesReport(String startDate, String endDate) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse(
          '${Variables.baseUrl}/api/report/product-sales?start_date=$startDate&end_date=$endDate'
        ),
        headers: {
          'Authorization': 'Bearer ${authData.result?.token.toString()}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return Right(ProductSalesResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  Future<Either<String, String>> closeCashier() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/report/close-cashier'),
        headers: {
          'Authorization': 'Bearer ${authData.result?.token.toString()}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return const Right('Cashier closed successfully');
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}