import 'package:chat_beeper/Screens/colllection/compose_beep.dart';
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
    return  Scaffold(
      appBar: PreferredSize(
          
          preferredSize: Size(428, 80),
          child: BottomAppBar()),
      body: ComposeBeep(),
    );
  }
}
