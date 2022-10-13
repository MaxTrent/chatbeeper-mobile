import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CountDown extends ChangeNotifier {
  int? _countTime;
  int? get countTime => _countTime;

  void countDown() {
    notifyListeners();
  }
}
