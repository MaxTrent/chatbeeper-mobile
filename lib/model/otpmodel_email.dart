// To parse this JSON data, do
//
//     final verifyEmail = verifyEmailFromJson(jsonString);

import 'dart:convert';

VerifyEmail verifyEmailFromJson(String str) => VerifyEmail.fromJson(json.decode(str));

String verifyEmailToJson(VerifyEmail data) => json.encode(data.toJson());

class VerifyEmail {
  VerifyEmail({
    required this.username,
    required this.email,
    required this.token,
  });

  String username;
  String email;
  String token;

  factory VerifyEmail.fromJson(Map<String, dynamic> json) => VerifyEmail(
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
