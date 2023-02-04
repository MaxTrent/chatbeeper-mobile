import 'package:chat_beeper/Widgets/app_drawer.dart';

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
  final _lkey = GlobalKey<ScaffoldState>();
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
        key: _lkey,
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
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: ' $notificationAction',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
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
                    height: 15.h,
                    width: 15.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    time,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 19.sp),
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
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: ' followed you',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
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
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '6 minutes ago',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 19.sp),
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
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: ' and 10+ others rebeeped your beep',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
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
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '2 minutes ago',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 19.sp),
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
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: ' showed interest in you',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
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
                              fontWeight: FontWeight.w500, fontSize: 19.sp),
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
                                      fontSize: 18.sp,
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
                                        fontSize: 19.sp,
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
                                      fontSize: 19.sp,
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
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: ' and 6 others disliked your beep',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
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
                    height: 15.h,
                    width: 15.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '1 hour ago',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 19.sp),
                  )
                ]),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
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
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: ' echoed your beep',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp),
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
                              fontWeight: FontWeight.w500, fontSize: 19.sp),
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
                      child: PostBeep(),
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
                              fontWeight: FontWeight.w600, fontSize: 16.sp),
                      children: [
                        TextSpan(
                          text: ' $notificationAction',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
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
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 19.sp),
                )
              ]),
            ),
          ),
        ),
      ),
      */

      drawer: const AppDrawer(),
    );
  }
}
