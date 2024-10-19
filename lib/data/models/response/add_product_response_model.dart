import 'package:megonopos/data/models/response/product_response_model.dart';
import 'dart:convert';

class AddProductResponseModel {
  final int code;
  final String message;
  final Result result;

  AddProductResponseModel({
    required this.code,
    required this.message,
    required this.result,
  });

  factory AddProductResponseModel.fromJson(String str) =>
      AddProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddProductResponseModel.fromMap(Map<String, dynamic> json) =>
      AddProductResponseModel(
        code: json["code"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "result": result.toMap(),
      };
}

class Result {
  final Product products;

  Result({
    required this.products,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        products: Product.fromMap(json["products"]),
      );

  Map<String, dynamic> toMap() => {
        "products": products.toMap(),
      };
}
