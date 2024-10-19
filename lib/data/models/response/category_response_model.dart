import 'dart:convert';

class CategoryResponseModel {
  final int? code;
  final String? message;
  final Result? result;

  CategoryResponseModel({
    this.code,
    this.message,
    this.result,
  });

  factory CategoryResponseModel.fromJson(String str) =>
      CategoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponseModel.fromMap(Map<String, dynamic> json) =>
      CategoryResponseModel(
        code: json["code"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "result": result?.toMap(),
      };
}

class Result {
  final List<Category>? categories;

  Result({
    this.categories,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  factory Category.fromLocal(Map<String, dynamic> json) => Category(
        id: json["category_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": id,
        "name": name,
      };

  @override
  String toString() => name!;
}
