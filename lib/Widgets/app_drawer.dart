import 'package:flutter/material.dart';
import 'package:chat_beeper/Screens/colllection/compose_beep.dart';
import 'package:chat_beeper/Screens/colllection/dm.dart';
import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Screens/drawer_pages/follower_request.dart';
import 'package:chat_beeper/Screens/drawer_pages/saved_beeps.dart';
import 'package:chat_beeper/Screens/drawer_pages/trending.dart';
import 'package:chat_beeper/Screens/followers.dart';
import 'package:chat_beeper/Screens/following.dart';
import 'package:chat_beeper/Screens/profile_page.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/Post.dart';
import '../../constants.dart';
import '../Screens/drawer_pages/request_verification.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _key = GlobalKey<ScaffoldState>();
  String fullName = 'Jane Doe';
  String username = 'Janedoe_10';

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
    return SizedBox(
      width: 372.w,
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 32.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/logo1.png',
                        height: 36.h,
                        width: 36.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                        ),
                        child: SizedBox(
                            height: 35.h,
                            // width: 159.w,
                            child: SvgPicture.asset(
                              'images/chatbeeper_blue.svg',
                            )),
                      ),
                    ],
                  ),
                ),
              ), //logo
              SizedBox(
                height: 39.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h, left: 16.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0.r),
                            child: Image.asset(
                              'images/pp_round.png',
                              height: 65.h,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                fullName,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.sp),
                              ), //full name
                              Text(
                                '\  $username',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                    color: uColor,
                                    fontSize: 21.sp),
                              ), //username
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 17.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const Following(),
                              //     ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  '100K',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 21.sp,
                                      ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  'Beeps',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                    color: uColor,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //beeps
                        SizedBox(
                          width: 7.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Followers(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  '800',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 21.sp,
                                      ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: uColor,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //followers
                        SizedBox(
                          width: 7.w,
                        ),
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Following(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  '2k',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22.sp,
                                      ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                    color: uColor,
                                    fontSize: 21.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //following
                      ],
                    ),
                  ), //following followers
                  SizedBox(
                    height: 12.h,
                  ),
                  Divider(
                    color: uColor,
                    thickness: 0.5.h,
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: darkModeOn
                                  ? SvgPicture.asset('images/profile white.svg')
                                  : SvgPicture.asset('images/profile.svg')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('My Profile',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //myprofile
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FollowerRequests(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: darkModeOn
                                  ? SvgPicture.asset(
                                      'images/profile-2user white.svg')
                                  : SvgPicture.asset(
                                      'images/profile-2user.svg')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Follower Requests',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //follower request
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Trending(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: darkModeOn
                                  ? SvgPicture.asset(
                                      'images/activity white.svg')
                                  : SvgPicture.asset('images/activity.svg')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Trending',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //Trending
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SavedBeeps(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: darkModeOn
                                  ? SvgPicture.asset('images/save-2 white.svg')
                                  : SvgPicture.asset('images/save-2.svg')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Saved Beeps',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //saved
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: darkModeOn
                                  ? SvgPicture.asset(
                                      'images/briefcase white.svg')
                                  : SvgPicture.asset('images/briefcase.svg')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Create Business Account',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //create businessman
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsPage(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: darkModeOn
                                ? SvgPicture.asset('images/setting-2 white.svg')
                                : SvgPicture.asset('images/setting-2.svg'),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Settings',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //settings
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RequestVerification(),
                            ));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: darkModeOn
                                  ? const Icon(
                                      Icons.verified_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    )
                                  : SvgPicture.asset(
                                      'images/verify black.svg')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Request Verification',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //request verification
              SizedBox(
                height: 5.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        onSurface: Colors.transparent,

                        // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: darkModeOn
                                ? SvgPicture.asset(
                                    'images/promotions black.svg',
                                    color: Colors.white,
                                  )
                                : SvgPicture.asset(
                                    'images/promotions black.svg'),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Sponsored Beeps',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn
                                          ? Colors.white
                                          : Colors.black)),
                        ],
                      ))), //promotions
            ],
          ),
        ),
      ),
    );
  }
}
