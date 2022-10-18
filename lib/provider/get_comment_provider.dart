import 'dart:convert';

import 'package:chat_beeper/model/get_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/secure_storage.dart';

class GetComment extends ChangeNotifier {
  late GetCommentModel getCommentModel;

  Future<void> fetchComment() async {
    getCommentModel = await getComment();
    notifyListeners();
  }

  Future<GetCommentModel> getComment() async {
    late GetCommentModel getCommentModel;
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        '/beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0';

    final uri = Uri.https(authority, unencodedPath);
    String? userJwt = await SecureStorage.getToken();
    try {
      final response =
          await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        getCommentModel = GetCommentModel.fromJson(data);
      } else {
        throw "Unable to retrieve posts.";
      }
    } catch (e) {
      print(e.toString());
    }
    return getCommentModel;
  }
}
