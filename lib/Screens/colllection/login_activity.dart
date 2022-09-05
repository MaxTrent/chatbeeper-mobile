import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);
  static const String id = 'Login Activity';

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    String device = 'iPhone 13';
    String location = 'Lagos, Nigeria';
    String lastSeen = 'Active now';

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
}
