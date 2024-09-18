import 'dart:convert';

class AuthResponseModel {
    final int code;
    final String message;
    final Result result;

    AuthResponseModel({
        required this.code,
        required this.message,
        required this.result,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
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
    final User user;
    final String token;

    Result({
        required this.user,
        required this.token,
    });

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        user: User.fromMap(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "token": token,
    };
}

class User {
    final int id;
    final String name;
    final String username;
    final String email;
    final dynamic emailVerifiedAt;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String isActive;
    final String phone;

    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.isActive,
        required this.phone,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        phone: json["phone"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "phone": phone,
    };
}
