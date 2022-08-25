import 'package:flutter/material.dart';


class Beep extends StatefulWidget {
  const Beep({Key? key}) : super(key: key);
  static const String id = 'beep';

  @override
  State<Beep> createState() => _BeepState();
}

class _BeepState extends State<Beep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
    );
  }
}
