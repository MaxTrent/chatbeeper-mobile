// To parse this JSON data, do
//
//     final getComment = getCommentFromJson(jsonString);

import 'dart:convert';

GetComment getCommentFromJson(String str) =>
    GetComment.fromJson(json.decode(str));

String getCommentToJson(GetComment data) => json.encode(data.toJson());

class GetComment {
  GetComment({
    required this.rebeepsCount,
    required this.text,
    required this.media,
    required this.repliesCount,
    required this.likesCount,
    required this.dislikesCount,
    required this.beepsCount,
    required this.v,
  });

  int rebeepsCount;
  String text;
  dynamic media;
  int repliesCount;
  int likesCount;
  int dislikesCount;
  int beepsCount;
  int v;

  factory GetComment.fromJson(Map<String, dynamic> json) => GetComment(
        rebeepsCount: json["rebeepsCount"],
        text: json["text"],
        media: json["media"],
        repliesCount: json["repliesCount"],
        likesCount: json["likesCount"],
        dislikesCount: json["dislikesCount"],
        beepsCount: json["beepsCount"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "rebeepsCount": rebeepsCount,
        "text": text,
        "media": media,
        "repliesCount": repliesCount,
        "likesCount": likesCount,
        "dislikesCount": dislikesCount,
        "beepsCount": beepsCount,
        "__v": v,
      };
}
