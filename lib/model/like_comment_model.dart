// To parse this JSON data, do
//
//     final likeCommentModel = likeCommentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LikeCommentModel likeCommentModelFromJson(String str) =>
    LikeCommentModel.fromJson(json.decode(str));

String likeCommentModelToJson(LikeCommentModel data) =>
    json.encode(data.toJson());

class LikeCommentModel {
  LikeCommentModel({
    required this.media,
    required this.text,
    required this.commentsCount,
    required this.likes,
    required this.likesCount,
    required this.dislikes,
    required this.dislikesCount,
    required this.beeps,
    required this.beepsCount,
    required this.comments,
    required this.repliesCount,
    required this.replies,
  });

  dynamic media;
  String text;
  int commentsCount;
  List<String> likes;
  int likesCount;
  List<dynamic> dislikes;
  int dislikesCount;
  List<dynamic> beeps;
  int beepsCount;
  List<LikeCommentModel>? comments;
  int repliesCount;
  List<dynamic>? replies;

  factory LikeCommentModel.fromJson(Map<String, dynamic> json) =>
      LikeCommentModel(
        media: json["media"],
        text: json["text"],
        commentsCount:
            json["commentsCount"] == null ? null : json["commentsCount"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        likesCount: json["likesCount"],
        dislikes: List<dynamic>.from(json["dislikes"].map((x) => x)),
        dislikesCount: json["dislikesCount"],
        beeps: List<dynamic>.from(json["beeps"].map((x) => x)),
        beepsCount: json["beepsCount"],
        comments: json["comments"] == null
            ? null
            : List<LikeCommentModel>.from(
                json["comments"].map((x) => LikeCommentModel.fromJson(x))),
        repliesCount:
            json["repliesCount"] == null ? null : json["repliesCount"],
        replies: json["replies"] == null
            ? null
            : List<dynamic>.from(json["replies"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "media": media,
        "text": text,
        "commentsCount": commentsCount == null ? null : commentsCount,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "likesCount": likesCount,
        "dislikes": List<dynamic>.from(dislikes.map((x) => x)),
        "dislikesCount": dislikesCount,
        "beeps": List<dynamic>.from(beeps.map((x) => x)),
        "beepsCount": beepsCount,
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "repliesCount": repliesCount == null ? null : repliesCount,
        "replies":
            replies == null ? null : List<dynamic>.from(replies!.map((x) => x)),
      };
}
