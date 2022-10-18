// To parse this JSON data, do
//
//     final createComment = createCommentFromJson(jsonString);

import 'dart:convert';

CreateComment createCommentFromJson(String str) =>
    CreateComment.fromJson(json.decode(str));

String createCommentToJson(CreateComment data) => json.encode(data.toJson());

class CreateComment {
  CreateComment({
    required this.text,
  });

  String text;

  factory CreateComment.fromJson(Map<String, dynamic> json) => CreateComment(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
