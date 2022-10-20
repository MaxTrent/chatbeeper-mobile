import 'dart:convert';
import 'package:chat_beeper/model/get_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/api_services.dart';
import '../data/secure_storage.dart';

class GetComment extends ChangeNotifier {
  late GetCommentModel getCommentModel;
  late ApiServices apiServices;

  Future<void> fetchComment(context) async {
    getCommentModel = await apiServices.getComment(context);
    notifyListeners();
  }
}
