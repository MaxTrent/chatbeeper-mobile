import 'package:chat_beeper/data/api_services.dart';
import 'package:chat_beeper/model/like_comment_model.dart';
import 'package:flutter/material.dart';

class LikeCommentProvider extends ChangeNotifier {
  late LikeCommentModel likeCommentModel;

  Future<void> likeComments() async {
    likeCommentModel = await likeComment();
    notifyListeners();
  }
}
