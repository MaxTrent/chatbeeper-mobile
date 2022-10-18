import 'dart:convert';
import 'package:chat_beeper/model/get_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widgets/post_comment.dart';
import '../data/secure_storage.dart';

class GetComment extends ChangeNotifier {
  late GetCommentModel getCommentModel;

  Future<void> fetchComment(context) async {
    getCommentModel = await getComment(context);
    notifyListeners();
  }
}
