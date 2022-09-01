import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Screens/profile_page.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/Post.dart';
import '../../constants.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);
  static const String id = 'Timeline';

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          )),
          foregroundColor: bcolor1,
          backgroundColor: bcolor1,
          child: IconButton(
            icon: Icon(CupertinoIcons.pen),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => PostCard()));
            },
            color: Colors.white,
          ),
          onPressed: () {}),
      appBar: PreferredSize(
        preferredSize: Size(428.w, 68.h),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 18.w),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Row(
              children: [
                SizedBox(
                  height: 32.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ));
                    },
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                        child: Image.asset('images/pp_round.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            actions: [
              IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: Icon(
                    Icons.search,
                    size: 24.h,
                  )),
              SizedBox(
                width: 24.w,
              ),
              IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: GestureDetector(
                    child: Icon(
                      Icons.mail_outline,
                      size: 24.h,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        )),
                  ))
            ],
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

            //   Card(
            //   child: Wrap(
            //     children: [
            //       Column(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), ),
            //             ),
            //             height: 50.h,
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 Image.asset('images/Pp.png', height: 50.h, width: 50.w,),
            //                 Text('Mark Peter'),
            //                 Text('@markpetr', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: uColor, fontSize: 15.sp),),
            //               ],
            //             ),
            //           ),
            //           //mark caption
            //           Padding(
            //             padding:  EdgeInsets.only(left: 10.w, right: 10.w),
            //             child: Wrap(
            //               children: [
            //                 SizedBox(
            //                   height:80.h,
            //                 ),
            //                 Align(
            //                     alignment: Alignment.bottomRight,
            //                     child: Text('10 minutes ago',
            //                       style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: Colors.black),
            //                     )),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
          }),
    );
  }
}
