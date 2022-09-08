import 'dart:async';

import 'package:chat_beeper/Screens/authenticate_signup.dart';
import 'package:chat_beeper/Screens/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'confirm_Screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      Navigator.pushReplacementNamed(context, GetStarted.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            height: 90.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo1.png'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
