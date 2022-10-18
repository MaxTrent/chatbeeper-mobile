import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Widgets/GradientText.dart';
import 'package:chat_beeper/Widgets/app_drawer.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/room_post.dart';
import 'dm.dart';
import '../drawer_pages/follower_request.dart';
import '../drawer_pages/request_verification.dart';
import '../drawer_pages/saved_beeps.dart';
import '../drawer_pages/trending.dart';
import '../followers.dart';
import '../following.dart';
import '../profile_page.dart';

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);
  static const String id = 'Room';
  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
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
      designSize: const Size(485, 926),
    );
    return Scaffold(
        key: _key,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(428.w, 62.h),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: uColor, style: BorderStyle.solid))),
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
                actions: [
                  // SizedBox(width: 12.w,),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 28.h, right: 20.w, bottom: 5.h),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => DirectMessage()));
                      },
                      child: darkModeOn == false
                          ? SvgPicture.asset(
                              color: Colors.black,
                              'images/search.svg',
                            )
                          : SvgPicture.asset(
                              color: Colors.white,
                              'images/search_dark.svg',
                            ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 28.h, right: 14.w, bottom: 5.h),
                    child: SizedBox(
                      height: 28.h,
                      width: 28.h,
                      child: Transform.scale(
                        scale: 1.2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DirectMessage()));
                          },
                          child: darkModeOn == false
                              ? SvgPicture.asset(
                                  color: Colors.black,
                                  'images/Dm.svg',
                                )
                              : SvgPicture.asset(
                                  color: Colors.white,
                                  'images/sms.svg',
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 130.h,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Interests',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Nunito',
                              fontSize: 22.sp,
                              color: bcolor5),
                        ),
                        PopupMenuButton<int>(
                          icon: SvgPicture.asset('images/setting-4.svg'),
                          iconSize: 28.h,
                          itemBuilder: (context) => [
                            // popupmenu item 1
                            PopupMenuItem(
                              value: 1,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  Text(
                                    "Change location",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                            // popupmenu item 2
                            PopupMenuItem(
                              value: 2,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  Text(
                                    "Preferred gender",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lock your room',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: darkModeOn
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  Transform.scale(
                                    scale: 0.7,
                                    child: CupertinoSwitch(
                                      value: false,
                                      onChanged: null,
                                      thumbColor: Colors.grey.shade500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                          offset: Offset(0, 40.h),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 2,
                        )
                      ],
                    ),
                  ), //interest and settings
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 16.w, right: 16.w),
                    child: SizedBox(
                      height: 60.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        separatorBuilder: ((context, index) => SizedBox(
                              width: 10.w,
                            )),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.0.r),
                                child: Image.asset(
                                  'images/pp_round.png',
                                  height: 60.h,
                                  width: 60.w,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ), //row of accounts
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: const Divider(
                color: uColor,
                thickness: 0.5,
              ),
            ),
            SizedBox(
              height: 560.h,
              // width: 368.w,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      RoomCard(),
                    ],
                  );
                },
              ),
            ), //listview
          ],
        ),
        drawer: AppDrawer());
  }
}
