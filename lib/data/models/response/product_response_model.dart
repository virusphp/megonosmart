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
  final int? id;
  final String name;
  final String? description;
  final int price;
  final int stock;
  final String category;
  final String image;
  final bool isBestSeller;
  final bool isSync;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.image,
    this.isBestSeller = false,
    this.isSync = true,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        image: json["image"] ?? '',
        isBestSeller: json["is_best_seller"] == 1 ? true : false,
        isSync: json["is_sync"] == null
            ? true
            : json["is_sync"] == 1
                ? true
                : false,
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "stock": stock,
        "category": category,
        "image": image,
        "is_best_seller": isBestSeller ? 1 : 0,
        "is_sync": isSync ? 1 : 0,
      };

 Product copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stock,
    String? category,
    String? image,
    bool? isBestSeller,
    bool? isSync,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      category: category ?? this.category,
      image: image ?? this.image,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      isSync: isSync ?? this.isSync,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
