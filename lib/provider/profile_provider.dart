import 'package:chat_beeper/data/api_services.dart';
import 'package:chat_beeper/model/profile_model.dart';
import 'package:flutter/material.dart';

import '../Screens/profile_page.dart';

class GetProfileProvider extends ChangeNotifier {
  late GetProfileModel profileModel;

  Future<void> fetchProfile(context) async {
    profileModel = await getProfile(context);
    notifyListeners();
  }
}
