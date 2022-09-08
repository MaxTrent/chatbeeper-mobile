import 'package:chat_beeper/Screens/colllection/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class Following extends StatefulWidget {
  const Following({Key? key}) : super(key: key);
  static const String id = 'following';

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  final String displayName = 'Mark Peter';
  final String username = 'markpetr';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    bool _isFollowed = false;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(428.w, 68.h),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: uColor, style: BorderStyle.solid))),
          child: AppBar(
            automaticallyImplyLeading: true,
            leading: Padding(
              padding: EdgeInsets.only(top: 29.h),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: darkModeOn == true ? Colors.white : Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, Home.id);
                },
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Text(
                'Following',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.5,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          dense: true,
          title: Row(
            children: [
              CircleAvatar(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0.r),
                      child: SvgPicture.asset('images/Frame 1.svg'))),
              SizedBox(
                width: 8.0.w,
              ),
              Text(
                "$displayName",
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                ' @$username',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              const Icon(
                Icons.verified_rounded,
                color: bcolor5,
                size: 15,
              ),
            ],
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(left: 56.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'A product design who loves\nsolving real life problems\nwith my superpower 😁',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      _isFollowed = true;
                    });
                  }),
                  child: Container(
                    height: 31.h,
                    width: 99.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff386FA4)),
                        borderRadius: BorderRadius.circular(16.0.r)),
                    child: Center(
                      child: _isFollowed == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Follow'),
                                Icon(
                                  Icons.add,
                                  size: 18.sp,
                                )
                              ],
                            )
                          : Text('Following'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
