import 'dart:convert';

class AuthErrorModel {
  final int? code;
  final String? message;
  final dynamic result;

  AuthErrorModel({
    this.code,
    this.message,
    this.result,
  });

  factory AuthErrorModel.fromJson(String str) =>
      AuthErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthErrorModel.fromMap(Map<String, dynamic> json) => AuthErrorModel(
        code: json["code"],
        message: json["message"],
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "result": result,
      };
}
