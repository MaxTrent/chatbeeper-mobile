// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.gender,
    required this.email,
    required this.phone,
  });

  String username;
  String firstname;
  String lastname;
  String dob;
  String gender;
  String email;
  String phone;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        dob: json["dob"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "dob": dob,
        "gender": gender,
        "email": email,
        "phone": phone,
      };
}
