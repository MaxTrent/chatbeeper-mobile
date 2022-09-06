import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
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
      appBar: AppBar(
        toolbarHeight: 40.h,
        elevation: 0.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkModeOn == true ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 135.0.w),
          child: Text('Settings',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 16.sp)),
        ),
      ),
      body:

          /*SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 2.h,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Login Activity',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              Divider(
                height: 16.h,
                thickness: 2.h,
              ),
              SizedBox(
                height: 93.h,
              ),*/
          ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => _mapDialog(context),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'images/location2.svg',
                            width: 20.w,
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0.w),
                            child: Text(location),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0.w),
                        child: Text(device),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(left: 32.0.w),
                    child: Text(
                      'Active now',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 12.sp, color: Color(0xff11CDF3)),
                    ),
                  ),
                );
              }),
    );
  }

  Future<void> _mapDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 50.h,
            width: 50.w,
            child: Column(
              children: [
                Text('Login Location'),
                Text('Login Location'),
                Text('Login Location'),
                Text('Login Location'),
              ],
            ),
          );
        });
  }
}
