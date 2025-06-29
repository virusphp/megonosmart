import 'dart:convert';

class SummaryResponseModel {
    final int? code;
    final String? message;
    final Result? result;

    SummaryResponseModel({
        this.code,
        this.message,
        this.result,
    });

    factory SummaryResponseModel.fromJson(String str) => SummaryResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SummaryResponseModel.fromMap(Map<String, dynamic> json) => SummaryResponseModel(
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
    final Summary? summary;

    Result({
        this.summary,
    });

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        summary: json["summary"] == null ? null : Summary.fromMap(json["summary"]),
    );

    Map<String, dynamic> toMap() => {
        "summary": summary?.toMap(),
    };
}

class Summary {
    final int? totalRevenue;
    final int? totalSoldQuantity;
    final int? totalOrder;

    Summary({
        this.totalRevenue,
        this.totalSoldQuantity,
        this.totalOrder,
    });

    factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        totalRevenue: json["total_revenue"],
        totalSoldQuantity: json["total_sold_quantity"],
        totalOrder: json["total_order"],
    );

    Map<String, dynamic> toMap() => {
        "total_revenue": totalRevenue,
        "total_sold_quantity": totalSoldQuantity,
        "total_order": totalOrder,
    };
}
