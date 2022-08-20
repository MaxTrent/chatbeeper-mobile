// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  SignUp({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
    required this.dob,
    required this.gender,
  });

  String username;
  String firstname;
  String lastname;
  String phone;
  String email;
  String password;
  String dob;
  String gender;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    dob: json["dob"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "email": email,
    "password": password,
    "dob": dob,
    "gender": gender,
  };
}
