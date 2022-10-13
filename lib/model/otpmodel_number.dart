// To parse this JSON data, do
//
//     final otpmodelNumber = otpmodelNumberFromJson(jsonString);

import 'dart:convert';

OtpmodelNumber otpmodelNumberFromJson(String str) =>
    OtpmodelNumber.fromJson(json.decode(str));

String otpmodelNumberToJson(OtpmodelNumber data) => json.encode(data.toJson());

class OtpmodelNumber {
  OtpmodelNumber({
    required this.username,
    required this.phone,
    required this.token,
  });

  String username;
  String phone;
  String token;

  factory OtpmodelNumber.fromJson(Map<String, dynamic> json) => OtpmodelNumber(
        username: json["username"],
        phone: json["phone"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "token": token,
      };
}
