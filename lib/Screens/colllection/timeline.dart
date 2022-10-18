import 'package:chat_beeper/Screens/colllection/compose_beep.dart';
import 'package:chat_beeper/Screens/colllection/dm.dart';
import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Screens/drawer_pages/follower_request.dart';
import 'package:chat_beeper/Screens/drawer_pages/saved_beeps.dart';
import 'package:chat_beeper/Screens/drawer_pages/trending.dart';
import 'package:chat_beeper/Screens/followers.dart';
import 'package:chat_beeper/Screens/following.dart';
import 'package:chat_beeper/Screens/profile_page.dart';
import 'package:chat_beeper/Widgets/app_drawer.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/Post.dart';
import '../../constants.dart';
import '../drawer_pages/request_verification.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);
  static const String id = 'Timeline';

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
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
    return Scaffold(
      key: _key,
      // floatingActionButton: FloatingActionButton(
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), topLeft:Radius.circular(10.r),topRight: Radius.circular(10.r), )
      //     ),
      //     foregroundColor: bcolor1,
      //     backgroundColor: bcolor1,
      //     child: IconButton(icon: const Icon(CupertinoIcons.pen), onPressed: () {
      //       Navigator.push(context,MaterialPageRoute(builder: (context) =>  ComposeBeep()));
      //     }, color: Colors.white,),
      //     onPressed: (){}),
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
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
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
                  padding: EdgeInsets.only(top: 28.h, right: 20.w, bottom: 5.h),
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
                  padding: EdgeInsets.only(top: 28.h, right: 18.w, bottom: 5.h),
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
                            ? Stack(
                                children: [
                                  SvgPicture.asset(
                                    color: Colors.black,
                                    'images/Dm.svg',
                                  ),
                                  Positioned(
                                    left: 16.w,
                                    child: Container(
                                      height: 15.h,
                                      width: 15.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(100.r)),
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  SvgPicture.asset(
                                    color: Colors.white,
                                    'images/sms.svg',
                                  ),
                                  Positioned(
                                    left: 16.w,
                                    child: Container(
                                      height: 15.h,
                                      width: 15.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(100.r)),
                                    ),
                                  )
                                ],
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                PostCard(),
                PostBeep(),
              ],
            );
          }),
      drawer: AppDrawer(),
    );
  }
}
