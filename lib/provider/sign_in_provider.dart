import 'package:chat_beeper/data/api_services.dart';
import 'package:chat_beeper/model/Signin_model.dart';
import 'package:flutter/material.dart';

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
