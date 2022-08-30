import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);
  static const String id = 'Room';
  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text('data')),
        ],
      ),
    );
  }
}
