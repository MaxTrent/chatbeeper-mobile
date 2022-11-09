// To parse this JSON data, do
//
//     final getBeepModel = getBeepModelFromJson(jsonString);

import 'dart:convert';

List<GetBeepModel> getBeepModelFromJson(String str) => List<GetBeepModel>.from(
    json.decode(str).map((x) => GetBeepModel.fromJson(x)));

String getBeepModelToJson(List<GetBeepModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBeepModel {
  GetBeepModel({
    required this.id,
    required this.text,
    required this.userId,
    required this.commentsCount,
    required this.likes,
    required this.likesCount,
    required this.dislikes,
    required this.dislikesCount,
    required this.beeps,
    required this.beepsCount,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String text;
  String userId;
  int commentsCount;
  List<dynamic> likes;
  int likesCount;
  List<dynamic> dislikes;
  int dislikesCount;
  List<dynamic> beeps;
  int beepsCount;
  List<dynamic> comments;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory GetBeepModel.fromJson(Map<String, dynamic> json) => GetBeepModel(
        id: json["_id"],
        text: json["text"],
        userId: json["userId"],
        commentsCount: json["commentsCount"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        likesCount: json["likesCount"],
        dislikes: List<dynamic>.from(json["dislikes"].map((x) => x)),
        dislikesCount: json["dislikesCount"],
        beeps: List<dynamic>.from(json["beeps"].map((x) => x)),
        beepsCount: json["beepsCount"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "userId": userId,
        "commentsCount": commentsCount,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "likesCount": likesCount,
        "dislikes": List<dynamic>.from(dislikes.map((x) => x)),
        "dislikesCount": dislikesCount,
        "beeps": List<dynamic>.from(beeps.map((x) => x)),
        "beepsCount": beepsCount,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
