import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IdentityVerified extends StatefulWidget {
  const IdentityVerified({Key? key}) : super(key: key);

  @override
  State<IdentityVerified> createState() => _IdentityVerifiedState();
}

class _IdentityVerifiedState extends State<IdentityVerified> {
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
                color: Color(0xff8E8E8E),
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
                color: Color(0xff8E8E8E),
              ),
              SizedBox(
                height: 117.h,
              ),
              Center(
                child: SizedBox(
                    height: 181.63.h,
                    width: 202.w,
                    child: SvgPicture.asset('images/amico.svg')),
              ),
              SizedBox(
                height: 40.37.h,
              ),
              Center(
                child: Text(
                  'Your identity has been verified',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp, color: Color(0xff13D03D)),
                ),
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
                    onPressed: () {},
                    child: Text(
                      'Finish',
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
