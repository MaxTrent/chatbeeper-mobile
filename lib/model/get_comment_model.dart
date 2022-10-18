// To parse this JSON data, do
//
//     final GetCommentModel = GetCommentModelFromJson(jsonString);

import 'dart:convert';

GetCommentModel GetCommentModelFromJson(String str) =>
    GetCommentModel.fromJson(json.decode(str));

String GetCommentModelToJson(GetCommentModel data) =>
    json.encode(data.toJson());

class GetCommentModel {
  GetCommentModel({
    required this.rebeepsCount,
    required this.text,
    required this.media,
    required this.repliesCount,
    required this.likesCount,
    required this.dislikesCount,
    required this.beepsCount,
  });

  int rebeepsCount;
  String text;
  dynamic media;
  int repliesCount;
  int likesCount;
  int dislikesCount;
  int beepsCount;

  factory GetCommentModel.fromJson(Map<String, dynamic> json) =>
      GetCommentModel(
        rebeepsCount: json["rebeepsCount"],
        text: json["text"],
        media: json["media"],
        repliesCount: json["repliesCount"],
        likesCount: json["likesCount"],
        dislikesCount: json["dislikesCount"],
        beepsCount: json["beepsCount"],
      );

  Map<String, dynamic> toJson() => {
        "rebeepsCount": rebeepsCount,
        "text": text,
        "media": media,
        "repliesCount": repliesCount,
        "likesCount": likesCount,
        "dislikesCount": dislikesCount,
        "beepsCount": beepsCount,
      };
}
