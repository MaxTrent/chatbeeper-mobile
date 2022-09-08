import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
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
            }));
  }

  Future<void> _mapDialog(BuildContext context) {
    {
      return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text('Login Activity'),
          children: [
            GoogleMap(initialCameraPosition: _kGooglePlex),
            /*title: Text("Show Alert Dialog Box"),
          content: Text("You have raised a Alert Dialog Box"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],*/
          ],
        ),
      );
    }
  }
}
