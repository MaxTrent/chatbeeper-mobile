import 'package:chat_beeper/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPassed extends StatelessWidget {
  const OtpPassed({Key? key}) : super(key: key);
  static const String id = 'otppass-screen';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: Container(
              height: 70.h,
              width: 70.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/logo1.png',
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 7.h),
            child: Center(
                child: Text(
              'Authentication Succesful',
              style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                    fontSize: 22.sp,
                  ),
              textAlign: TextAlign.center,
            )),
          ),
          Center(
            child: Center(
              child: Text('Account successfully authenticated',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline5!
                      .copyWith(color: Colors.grey.shade700, fontSize: 17.sp)
                  // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                  ),
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.42.h),
            child: Center(
              child: Container(
                height: 340.h,
                width: 292.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'images/authsucces.png',
                      ),
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ), //image
          SizedBox(
            height: 54.h,
            width: 249.w,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff295b85)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.52.r),
                    side: const BorderSide(color: Colors.transparent),
                  ))),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Started',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline3!
                          .copyWith(
                            fontSize: 20.sp,
                          )),
                ],
              ),
            ),
          ), //get started
        ],
      ),
    );
  }
}
