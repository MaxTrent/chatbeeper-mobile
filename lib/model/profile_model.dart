// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.gender,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.email,
    required this.phone,
    this.profilePic,
    required this.getProfileModelId,
  });

  String? id;
  String? username;
  String? firstname;
  String? lastname;
  String? dob;
  String? gender;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? email;
  String? phone;
  dynamic profilePic;
  String? getProfileModelId;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    id: json["_id"] ?? "",
    username: json["username"] ?? "",
    firstname: json["firstname"] ?? "",
    lastname: json["lastname"] ?? "",
    dob: json["dob"] ?? "",
    gender: json["gender"] ?? "",
    userId: json["userId"] ?? "",
    createdAt: DateTime.parse(json["createdAt"] ?? ""),
    updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
    v: json["__v"]??"",
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    profilePic: json["profilePic"] ?? "",
    getProfileModelId: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id ?? "",
    "username": username?? "",
    "firstname": firstname?? "",
    "lastname": lastname?? "",
    "dob": dob ?? "",
    "gender": gender ?? "",
    "userId": userId ?? "",
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v ?? "",
    "email": email ?? "",
    "phone": phone ?? "",
    "profilePic": profilePic ?? "",
    "id": getProfileModelId ?? "",
  };
}