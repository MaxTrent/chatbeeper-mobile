import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
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
            onPressed: () => Navigator.pop(context),
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
                  'Password',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              Divider(
                height: 16.h,
                thickness: 2.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Your password must be strong. We advise a\ncombination of alphabets and numbers.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 58.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: Text(
                  'Current password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              TextFormField(),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: Text(
                  'New password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              TextFormField(),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: Text(
                  'Re-enter new password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              TextFormField(),
              SizedBox(
                height: 357.h,
              ),
              Center(
                child: SizedBox(
                  height: 54.h,
                  width: 400.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff9E9E9E)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          side: const BorderSide(color: Colors.transparent),
                        ))),
                    onPressed: () {},
                    child: Text(
                      'Save',
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
