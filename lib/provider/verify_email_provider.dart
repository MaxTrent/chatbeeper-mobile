import 'package:chat_beeper/data/api_services.dart';
import 'package:chat_beeper/model/otpmodel_email.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends ChangeNotifier {
  late VerifyEmailModel verifyEmailModel;

  Future<void> confirmEmail(context, username, email, token) async {
    verifyEmailModel = await verifyEmail(context, username, email, token);
    notifyListeners();
  }
}
