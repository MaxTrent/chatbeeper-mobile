import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'identity_verified.dart';

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
            padding: EdgeInsets.only(top: 25.0.h),
            child: Text('Settings',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4!
                    .copyWith(fontSize: 16.sp)),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
              thickness: 0.5.h,
                color:uColor,
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
                height: 16.h,
              thickness: 0.5.h,
                color:uColor,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: Text('Proof of Identity',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4!
                        .copyWith(fontSize: 24.sp, color: Color(0xff295B85))),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: Text(
                  'Please upload a copy of your international\npassport',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: Color(0xff295B85),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'International Passport',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 16.sp, color: Color(0xff295B85)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                child: DottedBorder(
                    color: Color.fromRGBO(41, 91, 133, 1),
                    padding: EdgeInsets.only(top: 29.h, bottom: 29.h),
                    strokeWidth: 1,
                    dashPattern: const [8, 8],
                    strokeCap: StrokeCap.butt,
                    child: Padding(
                      padding: EdgeInsets.only(left: 47.0.w, right: 35.w),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Upload your Passport',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4!
                                    .copyWith(
                                        fontSize: 16.sp,
                                        color: Color(0xff295B85)),
                              )),
                          SizedBox(
                            width: 40.w,
                          ),
                          SvgPicture.asset('images/Group 156.svg'),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 136.h,
              ),
              Center(
                child: SizedBox(
                  height: 54.h,
                  width: 400.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff295b85)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          side: const BorderSide(color: Colors.transparent),
                        ))),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IdentityVerified())),
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline3!
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
