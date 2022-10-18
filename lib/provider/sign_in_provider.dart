import 'dart:convert';

import 'package:chat_beeper/model/Signin_model.dart';
import 'package:chat_beeper/model/get_comment_model.dart';
import 'package:flutter/material.dart';
import '../Screens/sign_in.dart';

class LogIn extends ChangeNotifier {
  late LogInModel logInModel;
  bool _visible = false;
  bool get visible => _visible;

  Future<void> signIn(context, email, password) async {
    logInModel = await logIn(context, email, password);
    notifyListeners();
  }

  Future<void> changeVisibility() async {
    _visible = !_visible;
    notifyListeners();
  }
}
