import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:megonopos/core/constants/variables.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/models/request/product_request_model.dart';
import 'package:megonopos/data/models/response/add_product_response_model.dart';
import 'package:megonopos/data/models/response/category_response_model.dart';
import 'package:megonopos/data/models/response/product_response_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/products'),
      headers: {
        'Authorization': 'Bearer ${authData.result?.token.toString()}',
      },
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, AddProductResponseModel>> addProduct(
      ProductRequestModel productRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${authData.result?.token.toString()}',
      'Accept': 'Application/json'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/products'));
    request.fields.addAll(productRequestModel.toMap());
    request.files.add(await http.MultipartFile.fromPath(
        'image', productRequestModel.image.path));
    request.headers.addAll(headers);

    var response = await request.send();

    // var responseBody = await http.Response.fromStream(response);
    // print(responseBody);
    final String body = await response.stream.bytesToString();
    // print(body);

    if (response.statusCode == 201) {
      // print(body);
      return Right(AddProductResponseModel.fromJson(body));
    } else {
      return const Left('Gagal besama');
    }
  }

  //get categories
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/categories'),
      headers: {
        'Authorization': 'Bearer ${authData.result?.token.toString()}',
        'Accept': 'Application/json'
      },
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return right(CategoryResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}
