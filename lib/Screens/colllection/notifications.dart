import 'settings_page.dart';
import '../../Widgets/post_imageless.dart';
import '../../constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer_pages/follower_request.dart';
import '../drawer_pages/request_verification.dart';
import '../drawer_pages/saved_beeps.dart';
import '../drawer_pages/trending.dart';
import '../followers.dart';
import '../following.dart';
import '../profile_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static const String id = 'Notifications';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _key = GlobalKey<ScaffoldState>();
  String fullName = 'Jane Doe';
  String username = 'Janedoe_10';

  bool? _followBack;
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
    bool? isOnline;
    String? imageUrl = '';
    String? notificationName = '';
    String? notificationAction = '';
    String? time = '';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: uColor, style: BorderStyle.solid))),
          child: SafeArea(
            child: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  height: 28.h,
                  child: GestureDetector(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                        child: Image.asset('images/pp_round.png'),
                      ),
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 20.h, right: 66.w),
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
      ),
      key: _key,
      body: ListView(
        key: _key,
        controller: ScrollController(),
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: uColor,
            ))),
            child: ListTile(
              dense: false,
              title: Row(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(imageUrl)),
                    ),
                    Positioned(
                      left: 32.w,
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: isOnline == true
                                ? Color(0xff40F27B)
                                : Color(0xff9E9E9E),
                            border: Border.all(color: Color(0xffFCFCFC)),
                            borderRadius: BorderRadius.circular(100.r)),
                      ),
                    )
                  ]),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: notificationName,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: ' $notificationAction',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                          )
                        ]),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 60.0.w),
                child: Row(children: [
                  SvgPicture.asset(
                    'images/like.svg',
                    height: 11.h,
                    width: 13.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    time,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
                  )
                ]),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: uColor,
            ))),
            child: ListTile(
              dense: false,
              title: Row(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(imageUrl)),
                    ),
                    Positioned(
                      left: 32.w,
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: isOnline == true
                                ? Color(0xff40F27B)
                                : Color(0xff9E9E9E),
                            border: Border.all(color: Color(0xffFCFCFC)),
                            borderRadius: BorderRadius.circular(100.r)),
                      ),
                    )
                  ]),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Jesse Philip',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: ' followed you',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                          )
                        ]),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 60.0.w),
                child: Row(children: [
                  SvgPicture.asset(
                    'images/user-add.svg',
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '6 minutes ago',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
                  )
                ]),
              ),
              trailing: GestureDetector(
                onTap: (() {
                  // setState(() {
                  //   _followBack = _followBack;
                  //   print(_followBack);
                  // });
                }),
                child: Container(
                  height: 31.h,
                  width: 99.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff386FA4)),
                      borderRadius: BorderRadius.circular(16.0.r)),
                  child: Center(
                    child: _followBack == false
                        ? const Text(
                            'Follow back',
                            style: TextStyle(color: bcolor3),
                          )
                        : const Text(
                            'Following',
                            style: TextStyle(color: bcolor3),
                          ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: uColor,
            ))),
            child: ListTile(
              dense: false,
              title: Row(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(imageUrl)),
                    ),
                    Positioned(
                      right: 5.w,
                      bottom: -1.h,
                      child: CircleAvatar(
                        radius: 15.r,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.asset(
                              /*width: 10.w,
                              height: 10.h,*/
                              imageUrl,
                            )),
                      ),
                    ),
                    Positioned(
                      left: 16.w,
                      bottom: -1.h,
                      child: CircleAvatar(
                        radius: 15.r,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.asset(
                              /*width: 10.w,
                              height: 10.h,*/
                              'images/pp_round.png',
                            )),
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Jesse Philip',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: ' and 10+ others rebeeped your beep',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                          )
                        ]),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 60.0.w),
                child: Row(children: [
                  SvgPicture.asset(
                    'images/rebeep.svg',
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    time,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
                  )
                ]),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: uColor,
            ))),
            child: ListTile(
              dense: false,
              title: Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(imageUrl)),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Chi Chi',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: ' showed interest in you',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                          )
                        ]),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 60.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '30 minutes ago',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 61.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  const Color(0xff9E9E9E80).withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(16.0.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Are you interested in her?',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 12.w,
                          ),
                          SizedBox(
                            height: 33.h,
                            width: 72.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xffEAEAEA)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                  ))),
                              onPressed: null,
                              child: Text(
                                'No',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3!
                                    .copyWith(
                                        fontSize: 12.sp,
                                        color: backgroundColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          SizedBox(
                            height: 33.h,
                            width: 72.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(bcolor1),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                  ))),
                              onPressed: null,
                              child: Text(
                                'Yes',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3!
                                    .copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: uColor,
            ))),
            child: ListTile(
              dense: false,
              title: Row(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(imageUrl)),
                    ),
                    Positioned(
                      left: 32.w,
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: isOnline == true
                                ? Color(0xff40F27B)
                                : Color(0xff9E9E9E),
                            border: Border.all(color: Color(0xffFCFCFC)),
                            borderRadius: BorderRadius.circular(100.r)),
                      ),
                    )
                  ]),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: notificationName,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: ' and 6 others disliked your beep',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                          )
                        ]),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 60.0.w),
                child: Row(children: [
                  SvgPicture.asset(
                    'images/dislike_blue.svg',
                    height: 11.h,
                    width: 13.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '1 hour ago',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
                  )
                ]),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: uColor,
            ))),
            child: ListTile(
              dense: false,
              title: Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(imageUrl)),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Chi Chi',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w600, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: ' echoed your beep',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                          )
                        ]),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 60.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '30 minutes ago',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  const Color(0xff9E9E9E80).withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(16.0.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(child: PostBeep()),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      /*ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: uColor,
          ))),
          child: ListTile(
            dense: false,
            title: Row(
              children: [
                Stack(children: [
                  CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(imageUrl)),
                  ),
                  Positioned(
                    left: 32.w,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: isOnline == true
                              ? Color(0xff40F27B)
                              : Color(0xff9E9E9E),
                          border: Border.all(color: Color(0xffFCFCFC)),
                          borderRadius: BorderRadius.circular(100.r)),
                    ),
                  )
                ]),
                SizedBox(
                  width: 12.w,
                ),
                RichText(
                  text: TextSpan(
                      text: notificationName,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.w600, fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: ' $notificationAction',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 14.sp),
                        )
                      ]),
                ),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(left: 60.0.w),
              child: Row(children: [
                SvgPicture.asset(
                  'images/like.svg',
                  height: 11.h,
                  width: 13.w,
                ),
                SizedBox(width: 5.w),
                Text(
                  time,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp),
                )
              ]),
            ),
          ),
        ),
      ),
      */

      drawer: SizedBox(
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
                                          fontSize: 18.sp),
                                ), //full name
                                Text(
                                  '\  $username',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      color: uColor,
                                      fontSize: 17.sp),
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
                                          fontSize: 17.sp,
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
                                      fontSize: 17.sp,
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
                                          fontSize: 17.sp,
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
                                      fontSize: 17.sp,
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
                                          fontSize: 18.sp,
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
                                      fontSize: 17.sp,
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
                                    ? SvgPicture.asset(
                                        'images/profile white.svg')
                                    : SvgPicture.asset('images/profile.svg')),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text('My Profile',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //myprofile
                SizedBox(
                  height: 15.h,
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
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //follower request
                SizedBox(
                  height: 15.h,
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
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //Trending
                SizedBox(
                  height: 15.h,
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
                                    ? SvgPicture.asset(
                                        'images/save-2 white.svg')
                                    : SvgPicture.asset('images/save-2.svg')),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text('Saved Beeps',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //saved
                SizedBox(
                  height: 15.h,
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
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //create businessman
                SizedBox(
                  height: 15.h,
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
                                  ? SvgPicture.asset(
                                      'images/setting-2 white.svg')
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
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //settings
                SizedBox(
                  height: 15.h,
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
                                builder: (context) =>
                                    const RequestVerification(),
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
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black)),
                          ],
                        ))), //request verification
                SizedBox(
                  height: 15.h,
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
                                        fontSize: 15.sp,
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
      ),
    );
  }
}
