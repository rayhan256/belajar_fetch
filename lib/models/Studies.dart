import 'dart:convert';

Studies studiesFromJson(String str) => Studies.fromJson(json.decode(str));
String studiesToJson(Studies data) => json.encode(data.toJson());

class Studies {
  Studies({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  Result result;

  factory Studies.fromJson(Map<String, dynamic> json) => Studies(
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
    this.data,
    this.currentPage,
    this.nextPage,
    this.totalItems,
    this.totalPages,
  });

  List<Datum> data;
  int currentPage;
  dynamic nextPage;
  int totalItems;
  int totalPages;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        currentPage: json["currentPage"],
        nextPage: json["nextPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "currentPage": currentPage,
        "nextPage": nextPage,
        "totalItems": totalItems,
        "totalPages": totalPages,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.content,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  String content;
  String image;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
        "user_id": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
