import 'package:flutter/material.dart';

class ChatModel {
  Widget message;
  String messageType;
  String imageUrl;
  String time;

  ChatModel(
      {required this.message,
      required this.messageType,
      required this.imageUrl,
      required this.time});
}
