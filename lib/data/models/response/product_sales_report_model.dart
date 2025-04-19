import 'dart:convert';

class ProductSalesResponseModel {
    final int? code;
    final String? message;
    final Result? result;

    ProductSalesResponseModel({
        this.code,
        this.message,
        this.result,
    });

    factory ProductSalesResponseModel.fromJson(String str) => ProductSalesResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductSalesResponseModel.fromMap(Map<String, dynamic> json) => ProductSalesResponseModel(
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
    final List<ProductSale>? productSales;

    Result({
        this.productSales,
    });

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        productSales: json["product_sales"] == null ? [] : List<ProductSale>.from(json["product_sales"]!.map((x) => ProductSale.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "product_sales": productSales == null ? [] : List<dynamic>.from(productSales!.map((x) => x.toMap())),
    };
}

class ProductSale {
    final int? productId;
    final String? productName;
    final int? productPrice;
    final String? totalQuantity;
    final int? totalPrice;

    ProductSale({
        this.productId,
        this.productName,
        this.productPrice,
        this.totalQuantity,
        this.totalPrice,
    });

    factory ProductSale.fromJson(String str) => ProductSale.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductSale.fromMap(Map<String, dynamic> json) => ProductSale(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        totalQuantity: json["total_quantity"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toMap() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "total_quantity": totalQuantity,
        "total_price": totalPrice,
    };
}
