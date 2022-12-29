import 'dart:async';
import 'package:chat_beeper/Widgets/last_login_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import '../../constants.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);
  static const String id = 'Login Activity';

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  String device = 'iPhone 13';
  String location = 'Lagos, Nigeria';
  String lastSeen = 'Active now';
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(428.w, 68.h),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: uColor, style: BorderStyle.solid))),
            child: AppBar(
              automaticallyImplyLeading: true,
              leading: Padding(
                padding: EdgeInsets.only(top: 29.h),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: darkModeOn == true ? Colors.white : Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: Text(
                  'Settings',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
              // leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
              //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Timeline()
              //   ));
              // },)),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) => const LastLoginCard()));
  }
}
