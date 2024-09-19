import 'package:meta/meta.dart';
import 'dart:convert';

class ProductResponseModel {
  final int code;
  final String message;
  final Result result;

  ProductResponseModel({
    required this.code,
    required this.message,
    required this.result,
  });

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
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
  final List<Product> products;

  Result({
    required this.products,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stock;
  final Category category;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
        price: json["price"],
        stock: json["stock"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "category": categoryValues.reverse[category],
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Category { DRINK, FOOD, SNACK }

final categoryValues = EnumValues(
    {"drink": Category.DRINK, "food": Category.FOOD, "snack": Category.SNACK});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
