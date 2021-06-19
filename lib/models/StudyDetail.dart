// To parse this JSON data, do
//
//     final studyDetails = studyDetailsFromJson(jsonString);

import 'dart:convert';

StudyDetails studyDetailsFromJson(String str) =>
    StudyDetails.fromJson(json.decode(str));

String studyDetailsToJson(StudyDetails data) => json.encode(data.toJson());

class StudyDetails {
  StudyDetails({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  Result result;

  factory StudyDetails.fromJson(Map<String, dynamic> json) => StudyDetails(
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
