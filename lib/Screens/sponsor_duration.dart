import 'package:chat_beeper/Screens/sponsor_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorDuration extends StatelessWidget {
  const SponsorDuration({Key? key}) : super(key: key);

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
      appBar: Appbar(),
      body: Padding(
        padding: EdgeInsets.only(left: 23.0.h, top: 23.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Duration',
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                  color: darkModeOn ? Colors.white : bcolor1,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
                height: 30.h,
                width: 130.w,
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r), color: bcolor1),
                child: Center(
                  child: Text(
                    'Days',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 17.sp),
                  ),
                )),
            SizedBox(
              height: 22.h,
            ),
            Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '1 Day',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '2 Days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '3 Days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '4 Days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '5 Days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '6 Days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '7 Days',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
              ],
            ),
            SizedBox(
              height: 52.h,
            ),
            Container(
                height: 30.h,
                width: 130.w,
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r), color: bcolor1),
                child: Center(
                  child: Text(
                    'Months',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 17.sp),
                  ),
                )),
            SizedBox(
              height: 22.h,
            ),
            Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '1 Month',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '2 Months',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '3 Months',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '4 Months',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '5 Months',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '6 Months',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
              ],
            ),
            SizedBox(
              height: 52.h,
            ),
            Container(
                height: 30.h,
                width: 130.w,
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r), color: bcolor1),
                child: Center(
                  child: Text(
                    'Years',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(color: Colors.white, fontSize: 17.sp),
                  ),
                )),
            SizedBox(
              height: 22.h,
            ),
            Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '1 Year',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '2 Years',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: SizedBox(
                    height: 30.h,
                    width: 90.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 10.w)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            side: const BorderSide(color: bcolor1),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SponsorPayment(),
                            ));
                      },
                      child: Text(
                        '3 Years',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3!
                            .copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: darkModeOn ? Colors.white : bcolor1),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
