import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadAlert extends StatelessWidget {
  const UploadAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      titlePadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      buttonPadding:EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.only(bottom: 9.h),
      alignment: const Alignment(-2,0.928),
      backgroundColor: Colors.white.withOpacity(0.7),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(
              Radius.circular(100.0.r))),
      actionsAlignment: MainAxisAlignment.center,
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          var brightness = MediaQuery.of(context).platformBrightness;
          bool darkModeOn = brightness == Brightness.dark;

          return SizedBox(
            width: 257.w, height: 51.h,
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset('images/warning.svg'),
                  Text('Please upload your international passport to access this feature.',
                    style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500
                    ),),
                ],
              ),
            )
          );
        },
      ),
    );
  }
}
