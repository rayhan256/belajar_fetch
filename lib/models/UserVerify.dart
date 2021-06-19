// To parse this JSON data, do
//
//     final userVerify = userVerifyFromJson(jsonString);

import 'dart:convert';

UserVerify userVerifyFromJson(String str) =>
    UserVerify.fromJson(json.decode(str));

String userVerifyToJson(UserVerify data) => json.encode(data.toJson());

class UserVerify {
  UserVerify({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  Result result;

  factory UserVerify.fromJson(Map<String, dynamic> json) => UserVerify(
        status: json["status"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.exp,
    this.data,
    this.iat,
  });

  int exp;
  Data data;
  int iat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        exp: json["exp"],
        data: Data.fromJson(json["data"]),
        iat: json["iat"],
      );

  Map<String, dynamic> toJson() => {
        "exp": exp,
        "data": data.toJson(),
        "iat": iat,
      };
}

class Data {
  Data({
    this.type,
    this.id,
  });

  String type;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
      };
}
