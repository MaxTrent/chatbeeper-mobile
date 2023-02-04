import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:chat_beeper/Widgets/rebeep_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_beeper/Screens/comment_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:like_button/like_button.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Screens/colllection/create_comment.dart';
import '../data/api_services.dart';
import '../data/secure_storage.dart';
import '../model/get_beep_model.dart';

class PostBeep extends StatefulWidget {
  PostBeep({Key? key}) : super(key: key);
  static const String id = 'post-card';

  @override
  State<PostBeep> createState() => _PostBeepState();
}

class _PostBeepState extends State<PostBeep> {
  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  String fullName = 'Sarah Madini';

  String username = 'Madini';

  String posttime = '1 hour ago';

  final bool _rebeeped = false;
  // late Future<GetBeepModel> futureBeep;

  List<GetBeepModel>? model;

  @override
  void initState() {
   //getBeep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          width: 428.w,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

    buildCollapsed1() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(4.w, 0.h, 0.w, 5.h),
          child: SizedBox(
            height: 60.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                        child: Image.asset(
                          'images/sarah.png',
                          height: 40.h,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "\ $fullName\ ",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22.sp),
                                ),
                                Text(
                                  '@$username ',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      color: darkModeOn==false?Colors.grey:Colors.grey.shade500,
                                      fontSize: 19.sp),
                                ),
                                 Icon(
                                  Icons.verified_rounded,
                                  color: bcolor5,
                                  size: 15.h,
                                ),
                              ],
                            ),
                            Text(
                              '\ $posttime',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500,
                                  color: darkModeOn==false?Colors.grey:Colors.grey.shade500,
                                  fontSize: 17.sp),
                            ),
                          ],
                        ),
                    ),
                      Spacer(),
                      Column(
                        children: [
                          SizedBox(height: 7.h),
                          Container(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.grey.shade300,
                            height: 28.h,
                            width: 80.w,
                            child: Center(
                              child: Text(
                                'Sponsored',
                                style: TextStyle(
                                    color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? fColor2
                                        : Colors.black),
                                    fontSize: 15.sp,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 25.0.h),
                        child: PopupMenuButton<int>(
                          icon: Icon(
                            Icons.more_vert_sharp,
                            size: 24.h,
                            color:
                                Theme.of(context).colorScheme.secondaryVariant,
                          ),
                          iconSize: 24.h,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              height: 40.h,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: darkModeOn == false
                                          ? SvgPicture.asset('images/mute.svg')
                                          : SvgPicture.asset(
                                              'images/mute.svg',
                                              color: Colors.white,
                                            )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Mute",
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
                            ), //mute
                            PopupMenuItem(
                              height: 40.h,
                              value: 2,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: darkModeOn == false
                                          ? SvgPicture.asset('images/block.svg')
                                          : SvgPicture.asset(
                                              'images/block.svg',
                                              color: Colors.white,
                                            )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Block",
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
                            ), //block
                            PopupMenuItem(
                              height: 40.h,
                              value: 3,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: darkModeOn == false
                                          ? SvgPicture.asset(
                                              'images/unfollow.svg')
                                          : SvgPicture.asset(
                                              'images/unfollow.svg',
                                              color: Colors.white,
                                            )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Unfollow",
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
                            ), //unfollow
                            PopupMenuItem(
                              value: 4,
                              height: 40.h,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: darkModeOn == false
                                          ? SvgPicture.asset(
                                              'images/not interested.svg')
                                          : SvgPicture.asset(
                                              'images/not interested.svg',
                                              color: Colors.white,
                                            )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Not interested in this",
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
                            ), //not interested
                            PopupMenuItem(
                              value: 5,
                              height: 40.h,
                              // row has two child icon and text.
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: darkModeOn == false
                                          ? SvgPicture.asset(
                                              'images/report.svg')
                                          : SvgPicture.asset(
                                              'images/report.svg',
                                              color: Colors.white,
                                            )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Report this account",
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
                            ), //report
                          ],
                          offset: Offset(-4.w, 30.h),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]); //top of card
    }

    buildCollapsed2() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 10.w,
              bottom: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Comment()));
                  },
                  child: Container(
                    child: ReadMoreText(
                      /* model![0].text*/ loremIpsum,
                      trimExpandedText: 'See less',
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'See more',
                      colorClickableText: fColor2,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.w300, fontSize: 25.sp),
                    ),
                  ),
                ),
              ],
            ),
          ), //readmore text
          Container(
            height: 0.2.h,
            color: uColor,
          ), //divider
          Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 0.w, bottom: 12.h, top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    'images/comment.svg',
                    height: 24.h,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateComment()));
                  },
                ),
                Text(
                  ' 100',
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(
                  width: 40.w,
                ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => const RebeepResponse(),
                    );
                  },
                  child: LikeButton(
                    size: 30.h,
                    circleColor: CircleColor(
                        start: Colors.red.shade700, end: Colors.red.shade800),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red.shade700,
                      dotSecondaryColor: Colors.red.shade800,
                    ),
                    likeBuilder: (bool _rebeeped) {
                      return _rebeeped == false
                          ? SizedBox(
                              height: 35.h,
                              child: SvgPicture.asset(
                                'images/rebeep.svg',
                                height: 30.h,
                                fit: BoxFit.fill,
                              ))
                          : SvgPicture.asset(
                              'images/rebeep.svg',
                              color: Colors.red,
                              height: 30.h,
                            );
                    },
                    likeCount: 100,
                    likeCountPadding: EdgeInsets.only(left: 3.w),
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                LikeButton(
                  size: 24.h,
                  circleColor: CircleColor(
                      start: Colors.red.shade700, end: Colors.red.shade800),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red.shade700,
                    dotSecondaryColor: Colors.red.shade800,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false
                        ? SvgPicture.asset(
                            'images/dislike_blue.svg',
                          )
                        : SvgPicture.asset('images/dislike_red.svg');
                  },
                  likeCount: 100,
                  likeCountPadding: EdgeInsets.only(left: 3.w),
                  // countBuilder: (int count, bool isLiked, String text) {
                  //   var color = isLiked ? Colors.deepPurpleAccent : fColor2;
                  //   Widget result;
                  //   if (count == 0) {
                  //     result = Text(
                  //       "love",
                  //       style: TextStyle(color: color),
                  //     );
                  //   } else
                  //     result = Text(
                  //       text,
                  //       style: TextStyle(color: color),
                  //     );
                  //   return result;
                  // },
                ), //brokenheart
                SizedBox(
                  width: 40.w,
                ),
                LikeButton(
                  size: 24.h,
                  circleColor:
                      CircleColor(start: Colors.red.shade200, end: Colors.red),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.red,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false
                        ? SvgPicture.asset(
                            'images/like.svg',
                          )
                        : SvgPicture.asset('images/favorite_red.svg');
                  },
                  likeCount: 100,
                  likeCountPadding: EdgeInsets.only(left: 3.w),
                  //   countBuilder: (int count, bool isLiked, String text){
                  //     var color = isLiked ? Colors.deepPurpleAccent : fColor2;
                  //     Widget result;
                  //     if (count == 0) {
                  //       result = Text(
                  //         "love",
                  //         style: TextStyle(color: color),
                  //       );
                  //     }else
                  //       result = Text(
                  //         text,
                  //         style: TextStyle(color: color),
                  //       );
                  //     return result;
                  //   }
                  // countBuilder: (int count, bool isLiked, String text) {
                  //   var color = isLiked ? Colors.deepPurpleAccent : fColor2;
                  //   Widget result;
                  //   if (count == 0) {
                  //     result = Text(
                  //       "love",
                  //       style: TextStyle(color: color),
                  //     );
                  //   } else
                  //     result = Text(
                  //       text,
                  //       style: TextStyle(color: color),
                  //     );
                  //   return result;
                  // },
                ), //heart
                Expanded(
                  child: GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: SvgPicture.asset(
                        'images/share.svg',
                        height: 26.h,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        useRootNavigator: true,
                        context: context,
                        builder: (context) => Container(
                          height: 336.h,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 6.h,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: fColor2,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100.r),
                                    ),
                                  ),
                                  height: 5.h,
                                  width: 45.w,
                                ),
                              ), //container
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.h,
                                  top: 6.h,
                                ),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Share Beep',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1!
                                        .copyWith(
                                      color: bcolor3,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ), //share beep
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 0.h,
                                    left: 40.w,
                                    right: 40.w,
                                    top: 37.h),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 30.h,
                                                  width: 30.w,
                                                  child: SvgPicture.asset(
                                                    'images/link.svg',
                                                    height: 30.h,
                                                    width: 30.w,
                                                    fit: BoxFit.contain,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Copy Link',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //copy
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 30.h,
                                                  width: 30.w,
                                                  child: SvgPicture.asset(
                                                    'images/bookmark.svg',
                                                    height: 30.h,
                                                    width: 30.w,
                                                    fit: BoxFit.contain,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Save',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                'images/Dm.svg',
                                                height: 30.h,
                                                width: 30.w,
                                                fit: BoxFit.contain,
                                                color: bcolor3,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'DM',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //whatsappp
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Image.asset(
                                                'images/facebook.png',
                                                height: 40.h,
                                                width: 40.w,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Facebook',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //facebook
                                  ],
                                ),
                              ), //icons 1
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 0.h,
                                    left: 59.w,
                                    right: 45.w,
                                    top: 37.h),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 30.h,
                                                  width: 30.w,
                                                  child: SvgPicture.asset(
                                                    'images/gmail.svg',
                                                    height: 100.h,
                                                    width: 100.w,
                                                    fit: BoxFit.contain,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Gmail',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //gmail
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                height: 35.h,
                                                width: 35.w,
                                                child: Image.asset(
                                                  'images/whatsapp.png',
                                                  height: 50.h,
                                                  width: 50.w,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Whatsapp',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Image.asset(
                                                'images/telegram.png',
                                                height: 35.h,
                                                width: 35.w,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Telegram',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //telegram
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: bcolor3)
                                            // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                            // ),
                                          ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 35.h,
                                                  width: 35.w,
                                                  child: SvgPicture.asset(
                                                    'images/discord.svg',
                                                    height: 35.h,
                                                    width: 35.w,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Discord',
                                          style: TextStyle(
                                              color: darkModeOn
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //discord
                                  ],
                                ),
                              ), //icons 2
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ), //share
              ],
            ), //icons
          ), //icons
        ],
      );
    }
    //image of card

    // buildCollapsed3() {
    //   return Container();
    // }

    buildExpanded1() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Expandable",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  Text(
                    "3 Expandable widgets",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ]);
    } //useless

    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: SizedBox(
        child: Card(
          elevation: 0,
          color: Theme.of(context).scaffoldBackgroundColor,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ExpandableTheme(
                data: ExpandableThemeData(),
                child: Expandable(
                  collapsed: buildCollapsed1(),
                  expanded: buildExpanded1(),
                ),
              ), //top
              Expandable(
                collapsed: buildCollapsed2(),
                expanded: buildExpanded1(),
              ), //write up
              // ),
              Divider(
                height: 1,
                color: uColor,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     Builder(
              //       builder: (context) {
              //         var controller =
              //         ExpandableController.of(context, required: true)!;
              //         return TextButton(
              //           child: Text(
              //             controller.expanded ? "COLLAPSE" : "EXPAND",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .button!
              //                 .copyWith(color: Colors.deepPurple),
              //           ),
              //           onPressed: () {
              //             controller.toggle();
              //           },
              //         );
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    ));
  }

  // Future<void> getBeep() async {
  //   List<GetBeepModel> getBeep;
  //   String authority = 'chatbeeper.onrender.com';
  //   String unencodedPath = '/beep';
  //   String? userJwt = await SecureStorage.getToken();
  //   final uri = Uri.https(authority, unencodedPath);
  //   final response =
  //       await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
  //   print(response.body);
  //   List<dynamic> body = jsonDecode(response.body);
  //   model = body.map((dynamic item) => GetBeepModel.fromJson(item)).toList();
  //   setState(() {});
  //
  //   // print(getBeepModel);
  //   // return getBeepModel;
  // }
}
