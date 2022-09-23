import 'package:chat_beeper/Widgets/user_post_imageless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'colllection/sponsor_payment_setup.dart';

class SponsorPayment extends StatefulWidget {
  const SponsorPayment({Key? key}) : super(key: key);

  @override
  State<SponsorPayment> createState() => _SponsorPaymentState();
}

class _SponsorPaymentState extends State<SponsorPayment> {
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
              'Sponsor this beep',
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                  color: bcolor1, fontSize: 19.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 67.h,
            ),
            UserPostBeep(),
            SizedBox(height: 179.h),
            Center(
              child: SizedBox(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SponsorPaymentSetup(),
                        ));
                  },
                  child: Text(
                    'Proceed to payment',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(fontSize: 17.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
