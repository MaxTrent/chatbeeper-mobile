import 'package:chat_beeper/Screens/colllection/home_page.dart';
import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'confirm_Screen.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);
  static const String id = 'get-started';

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 197.h,
          ),
          darkModeOn
              ? Container(
                  width: 324.w,
                  height: 251.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/getstarteddark.png'),
                    ),
                  ),
                )
              : Container(
                  width: 324.w,
                  height: 251.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/getstartedlight.png'),
                    ),
                  ),
                ),
          SizedBox(
            height: 221.h,
          ),
          Text(
            'Share. Interact. Mingle.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 56.h,
          ),
          SizedBox(
            height: 54.h,
            width: 400.w,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff295b85)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    side: const BorderSide(color: Colors.transparent),
                  ))),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmRegister(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(fontSize: 21.sp),
                    // TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w500,
                    //     fontFamily: 'Nunito',
                    //     fontSize: 17.sp
                    //
                    // ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ), //get started
        ],
      )),
    );
  }
}
