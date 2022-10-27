import 'package:chat_beeper/data/api_services.dart';
import 'package:chat_beeper/model/like_comment_model.dart';
import 'package:flutter/material.dart';

class LikeCommentProvider extends ChangeNotifier {
  late LikeCommentModel likeCommentModel;
  late ApiServices apiServices;

  Future<void> likeComments() async {
    likeCommentModel = await apiServices.likeComment();
    notifyListeners();
  }
}
