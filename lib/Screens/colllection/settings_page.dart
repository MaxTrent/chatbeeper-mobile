import 'package:chat_beeper/Screens/colllection/login_activity.dart';
// import 'package:chat_beeper/Screens/colllection/password.dart';
import 'package:chat_beeper/Screens/colllection/password_change.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contact_info.dart';
import 'deactivate_account.dart';
import 'identity_confirmation.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkModeOn == true ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings',
            style: Theme.of(context)
                .primaryTextTheme
                .headline4!
                .copyWith(fontSize: 16.sp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 2.h,
            ),
            ListTile(
              dense: true,
              title: Row(
                children: [
                  SvgPicture.asset('images/frame.svg'),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'Personal Information',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              onTap: null,
            ),
            Divider(
              thickness: 2.h,
            ),
            ListTile(
              dense: true,
              title: Text(
                'Contact Information',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactInfo())),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Identity Confirmation',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IdentityConfirmation())),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Deactivate account',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Colors.red),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DeactivateAccount())),
            ),
            ListTile(
              dense: true,
              title: Row(
                children: [
                  SvgPicture.asset('images/security-safe.svg'),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'Security',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              onTap: null,
            ),
            Divider(
              thickness: 2.h,
            ),
            ListTile(
              dense: true,
              title: Text(
                'Password',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasswordChange())),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Login Activity',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginActivity())),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Two-factor Authenticator',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: const Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              title: Text(
                'Lock your room',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: const CupertinoSwitch(
                onChanged: null,
                value: false,
              ),
            ),
            ListTile(
              dense: true,
              title: Row(
                children: [
                  SvgPicture.asset('images/notification.svg'),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'Notification',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              onTap: null,
            ),
            Divider(
              thickness: 2.h,
            ),
            ListTile(
              dense: true,
              title: Text(
                'Notification',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: const CupertinoSwitch(
                onChanged: null,
                value: false,
              ),
            ),
            ListTile(
              dense: true,
              title: Row(
                children: [
                  SvgPicture.asset('images/note.svg'),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'More',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.h,
            ),
            ListTile(
              dense: true,
              title: Text(
                'About',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              title: Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              title: Text(
                'Country',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 14.sp, color: Color(0xff8E8E8E)),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 17.h,
              ),
              onTap: () {},
            ),
            ListTile(
                dense: true,
                title: Row(
                  children: [
                    SvgPicture.asset('images/logout.svg'),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Text(
                        'Log Out',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 14.sp, color: Color(0xff386FA4)),
                      ),
                    ),
                  ],
                ),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
