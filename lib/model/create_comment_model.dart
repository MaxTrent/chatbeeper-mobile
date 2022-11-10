// To parse this JSON data, do
//
//     final CreateCommentModel = CreateCommentModelFromJson(jsonString);

import 'dart:convert';

CreateCommentModel CreateCommentModelFromJson(String str) =>
    CreateCommentModel.fromJson(json.decode(str));

String CreateCommentModelToJson(CreateCommentModel data) =>
    json.encode(data.toJson());

class CreateCommentModel {
  CreateCommentModel({
    required this.text,
  });

  String text;

  factory CreateCommentModel.fromJson(Map<String, dynamic> json) =>
      CreateCommentModel(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
