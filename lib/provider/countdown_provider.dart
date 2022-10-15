import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CountDown extends ChangeNotifier {
  static const maxSeconds = 60;
  late Timer _countDownTimer;
  int _seconds = maxSeconds;
  int get seconds => _seconds;
  Timer get countDownTimer => _countDownTimer;

  Future<void> startCountDown() async {
    Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    notifyListeners();
  }

  Future<void> resetCountDown() async {
    stopCountDown();
    _seconds = maxSeconds;
    _seconds--;
    notifyListeners();
  }

  Future<void> stopCountDown() async {
    _countDownTimer.cancel();
    notifyListeners();
  }

  Future<void> setCountDown() async {
    _seconds--;
    notifyListeners();
  }

  // Widget buildTimer() {
  //   return Text('$seconds');
  // }
}
