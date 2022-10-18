import 'package:chat_beeper/Screens/colllection/beep.dart';
import 'package:chat_beeper/Screens/drafts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';

class WriteBeep extends StatelessWidget {
  const WriteBeep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 100.h,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/logo1.png',
                height: 30.h,
              )),
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(text: '', children: [
                    TextSpan(
                      text: 'Compose a beep',
                      style: TextStyle(
                          color: fColor,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 22.sp),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Beep(),
                              ),
                            ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: RichText(
              text: TextSpan(text: '', children: [
                TextSpan(
                  text: 'OR',
                  style: TextStyle(
                      color: darkModeOn ? Colors.white : Colors.black,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.sp),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(text: '', children: [
                    TextSpan(
                      text: 'Go to draft',
                      style: TextStyle(
                          color: fColor,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 22.sp),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Drafts(),
                              ),
                            ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
