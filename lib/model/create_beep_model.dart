// To parse this JSON data, do
//
//     final createBeepModel = createBeepModelFromJson(jsonString);

import 'dart:convert';

CreateBeepModel createBeepModelFromJson(String str) =>
    CreateBeepModel.fromJson(json.decode(str));

String createBeepModelToJson(CreateBeepModel data) =>
    json.encode(data.toJson());

class CreateBeepModel {
  CreateBeepModel({
    required this.text,
  });

  String text;

  factory CreateBeepModel.fromJson(Map<String, dynamic> json) =>
      CreateBeepModel(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
