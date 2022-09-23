import 'package:chat_beeper/Screens/sponsor_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_beeper/Screens/colllection/dm.dart';
import '../../constants.dart';

class SponsorBeep extends StatelessWidget {
  SponsorBeep({Key? key}) : super(key: key);
  static const String id = 'sponsor-beep';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );

    Appbar() {
      return PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: uColor,
            style: BorderStyle.solid,
          ))),
          child: SafeArea(
            child: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: darkModeOn == true ? Colors.white : Colors.black,
                      size: 20,
                    ),
                    onPressed: (() => Navigator.pop(context))),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 7),
                child: SizedBox(
                    height: 34.h,
                    // width: 159.w,
                    child: SvgPicture.asset(
                      'images/chatbeeper_blue.svg',
                    )),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: Appbar(),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 16.w, top: 23.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'You care about your brand, we do too!',
                style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                    fontSize: 19.sp,
                    color: darkModeOn ? Colors.white : bcolor1,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              'Chatbeeper sponsored beeps are one of the effective advertising options offered to individuals and business owners. By defining your brand, or defining your beep, you get the best engagement regardless of the content. Be it about food, beauty, health, fashion, etc.\n\n\nSponsor your beeps to reach a vast array of users within our community and increase your brand awareness.',
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                  fontSize: 17.sp,
                  color: darkModeOn ? Colors.white : bcolor1,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 64.h,
            ),
            Text(
              'Select plan:',
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                  color: darkModeOn ? Colors.white : bcolor1,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0x33386FA4)),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                children: [
                  Text(
                    'Reach 1000 - 2000 users',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.sp, color: bcolor1),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 130.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(bcolor1),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: Colors.transparent),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorDuration(),
                            ));
                      },
                      child: Text(
                        '500 Naira daily',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                        // TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w500,
                        //     fontFamily: 'Nunito',
                        //     fontSize: 17.sp
                        //
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0x33386FA4)),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                children: [
                  Text(
                    'Reach 2000 - 3500 users',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.sp, color: bcolor1),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 130.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(bcolor1),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: Colors.transparent),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorDuration(),
                            ));
                      },
                      child: Text(
                        '1000 Naira daily',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                        // TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w500,
                        //     fontFamily: 'Nunito',
                        //     fontSize: 17.sp
                        //
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0x33386FA4)),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                children: [
                  Text(
                    'Reach 3500 - 5000 users',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.sp, color: bcolor1),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 130.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(bcolor1),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: Colors.transparent),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorDuration(),
                            ));
                      },
                      child: Text(
                        '2000 Naira daily',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                        // TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w500,
                        //     fontFamily: 'Nunito',
                        //     fontSize: 17.sp
                        //
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
