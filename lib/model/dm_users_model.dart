import 'dart:convert';

class DmUsers {
  String name;
  String? username;
  String message;
  String imageURL;
  String time;

  DmUsers(
      {required this.name,
      this.username,
      required this.message,
      required this.imageURL,
      required this.time});

      
}
