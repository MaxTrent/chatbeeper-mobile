// To parse this JSON data, do
//
//     final VerifyEmailModel = verifyEmailModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) =>
    VerifyEmailModel.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyEmailModel data) =>
    json.encode(data.toJson());

class VerifyEmailModel {
  VerifyEmailModel({
    required this.username,
    required this.email,
    required this.token,
  });

  String username;
  String email;
  String token;

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      VerifyEmailModel(
        username: json["username"] as String,
        email: json["email"] as String,
        token: json["token"] as String,
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "token": token,
      };
}
