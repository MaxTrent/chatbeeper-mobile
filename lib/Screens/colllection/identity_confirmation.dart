import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentityConfirmation extends StatefulWidget {
  const IdentityConfirmation({Key? key}) : super(key: key);

  @override
  State<IdentityConfirmation> createState() => _IdentityConfirmationState();
}

class _IdentityConfirmationState extends State<IdentityConfirmation> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 40.h,
          elevation: 0.h,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: darkModeOn == true ? Colors.white : Colors.black,
            ),
            onPressed: () {},
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 2.h,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Identity Confirmation',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              Divider(
                thickness: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.w),
                child: Text('Proof of Identity',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4!
                        .copyWith(fontSize: 24.sp, color: Color(0xff295B85))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.w),
                child: Text(
                  'Please upload a copy of your international\npassport',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.w),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff295B85),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    Text(
                      'International Passport',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
