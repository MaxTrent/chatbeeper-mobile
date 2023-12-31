import 'package:chat_beeper/Screens/colllection/language.dart';
import 'package:chat_beeper/Screens/colllection/login_activity.dart';
// import 'package:chat_beeper/Screens/colllection/password.dart';
import 'package:chat_beeper/Screens/colllection/password_change.dart';
import 'package:chat_beeper/Screens/colllection/two_fact_auth.dart';
import 'package:chat_beeper/constants.dart';
import 'package:chat_beeper/provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'contact_info.dart';
import 'country.dart';
import 'deactivate_account.dart';
import 'identity_confirmation.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String id = 'settings';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   bool  _isSwitched = false;
    return ChangeNotifierProvider(
      create: (context) => ModelTheme(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(width, 74.h),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: fColor2,
            ))),
            child: AppBar(
              toolbarHeight: 74.h,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(top: 29.h),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: darkModeOn == true ? Colors.white : Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: Text('Settings',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4!
                        .copyWith(fontSize: 25.sp)),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0.w),
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: [
                      darkModeOn
                          ? SvgPicture.asset(
                              'images/frame.svg',
                              color: Colors.white,
                            )
                          : SvgPicture.asset('images/frame.svg'),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Text(
                          'Personal Information',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline4!
                              .copyWith(fontSize: 25.sp),
                        ),
                      ),
                    ],
                  ),
                  onTap: null,
                ),
              ),
              Divider(
                thickness: 0.5.h,
                color: fColor2,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Contact Information',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.h,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactInfo())),
              ),//contact info
              ListTile(
                dense: true,
                title: Text(
                  'Identity Confirmation',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.h,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IdentityConfirmation())),
              ),//identity confirmation
              ListTile(
                dense: true,
                title: Text(
                  'Deactivate account',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: Colors.red),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeactivateAccount())),
              ),//deactivae
              Padding(
                padding: EdgeInsets.only(top: 5.0.w),
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: [
                      darkModeOn == false
                          ? SvgPicture.asset('images/security-safe.svg')
                          : SvgPicture.asset(
                              'images/security-safe.svg',
                              color: Colors.white,
                            ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Text(
                          'Security',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline4!
                              .copyWith(fontSize: 25.sp),
                        ),
                      ),
                    ],
                  ),
                  onTap: null,
                ),
              ), //security
              Divider(
                thickness: 0.5.h,
                color: fColor2,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.h,
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PasswordChange())),
              ),//password
              ListTile(
                dense: true,
                title: Text(
                  'Login Activity',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.h,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginActivity())),
              ),//login activity
              ListTile(
                  dense: true,
                  title: Text(
                    'Two-factor Authenticator',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 20.sp, color: fColor2),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 17.h,
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TwoFactAuth()))),//two factor auth
              ListTile(
                dense: true,
                title: Text(
                  'Lock your room',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: const CupertinoSwitch(
                  onChanged: null,
                  value: false,
                ),
              ),//lock room
              ListTile(
                dense: true,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      'images/notification.svg',
                      color: darkModeOn ? Colors.white : Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Text(
                        'Turn On Notifications',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(fontSize: 25.sp),
                      ),
                    ),
                  ],
                ),
                onTap: null,
              ),//notif
              Divider(
                thickness: 0.5.h,
                color: fColor2,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Notification',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
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
                    SvgPicture.asset(
                      'images/appearance.svg',
                      color: darkModeOn ? Colors.white : Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Text(
                        'Appearance',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(fontSize: 25.sp),
                      ),
                    ),
                  ],
                ),
                onTap: null,
              ),//appearance
              Divider(
                thickness: 0.5.h,
                color: fColor2,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Dark Mode',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Consumer<ModelTheme>(
                  builder: ((context, provider, child) {
                    return CupertinoSwitch(
                      onChanged: (value) {
                        provider.toggleTheme(value);
                      },
                      value: provider.isDarkMode,
                    );
                  }),
                ),
              ),
              ListTile(
                dense: true,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      'images/note.svg',
                      color: darkModeOn ? Colors.white : Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Text(
                        'More',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(fontSize: 25.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5.h,
                color: fColor2,
              ),
              ListTile(
                dense: true,
                title: Text(
                  'About',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
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
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.h,
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Language())),
              ),
              ListTile(
                dense: true,
                title: Text(
                  'Country',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20.sp, color: fColor2),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.h,
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Country())),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 20.sp,
                                  color: const Color(0xff386FA4)),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
