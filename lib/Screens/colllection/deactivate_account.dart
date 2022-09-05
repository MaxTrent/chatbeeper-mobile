import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DeactivateAccount extends StatefulWidget {
  const DeactivateAccount({Key? key}) : super(key: key);

  @override
  State<DeactivateAccount> createState() => _DeactivateAccountState();
}

class _DeactivateAccountState extends State<DeactivateAccount> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                thickness: 2.h,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Deactivate your account',
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
                height: 93.h,
              ),
              Center(
                child: SizedBox(
                    height: 156.72.h,
                    width: 217.54.w,
                    child:
                        SvgPicture.asset('images/undraw_monitor_iqpq 1.svg')),
              ),
              SizedBox(
                height: 7.28.h,
              ),
              Center(
                child: Text(
                  'The procedure to delete your account is about to\nbegin. All chatbeeper platforms will no longer allow\nusers to access your display name, @username, or\npublic profile.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 16.sp),
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
                            MaterialStateProperty.all(const Color(0xffF62B2B)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          side: const BorderSide(color: Colors.transparent),
                        ))),
                    onPressed: () {},
                    child: Text(
                      'Deactivate',
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
