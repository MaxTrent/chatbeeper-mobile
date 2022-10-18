import 'dart:convert';

import 'package:chat_beeper/data/secure_storage.dart';
import 'package:chat_beeper/provider/get_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:chat_beeper/Widgets/rebeep_response.dart';
import 'package:chat_beeper/Screens/comment_screen.dart';
import 'package:like_button/like_button.dart';
import 'package:chat_beeper/constants.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../model/get_comment_model.dart';

class PostComment extends StatefulWidget {
  const PostComment({Key? key}) : super(key: key);

  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  String fullName = 'Mary Lera';

  String username = 'markpetr';

  String posttime = '1 hour ago';

  final bool _rebeeped = false;

  late String loremIpsum;

  @override
  void initState() {
    super.initState();
    context.read<GetComment>().fetchComment(context);
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );

    buildCollapsed1() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(4.w, 3.h, 0.w, 12.h),
          child: SizedBox(
            height: 65.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 56.0.w),
                  child: RichText(
                      text: TextSpan(text: '', children: [
                    TextSpan(
                        text: 'Replying to',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2!
                            .copyWith(
                              color: fColor2,
                            )),
                    TextSpan(
                        text: ' @$username',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2!
                            .copyWith(color: fColor)),
                  ])),
                ),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
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
                                '@$username',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontSize: 21.sp),
                              ),
                              const Icon(
                                Icons.verified_rounded,
                                color: bcolor5,
                                size: 15,
                              ),
                            ],
                          ),
                          Text(
                            '\ $posttime',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                                color: fColor2,
                                fontSize: 17.sp),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        width: 3.w,
                      ),
                      PopupMenuButton<int>(
                        icon: Icon(
                          Icons.more_vert_sharp,
                          size: 24.h,
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                        iconSize: 24.h,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
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
                            // row has two child icon and text.
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 24.h,
                                    width: 24.w,
                                    child: darkModeOn == false
                                        ? SvgPicture.asset('images/report.svg')
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
                        offset: Offset(-28.w, 40.h),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        elevation: 2,
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
                ReadMoreText(
                  context.watch<GetComment>().getCommentModel.text,
                  trimExpandedText: 'see Less',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'see more',
                  colorClickableText: Colors.grey,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 25.sp),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Comment()));
                  },
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
                  child: _rebeeped == false
                      ? SizedBox(
                          height: 35.h,
                          child: SvgPicture.asset(
                            'images/rebeep.svg',
                            height: 30.h,
                          ))
                      : SvgPicture.asset(
                          'images/rebeep.svg',
                          color: Colors.red,
                          height: 35.h,
                        ),
                ), //infinite
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
                  //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
                  //     var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
                  //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
                SizedBox(
                  width: 110.w,
                ),
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
                                    color: Colors.grey.shade700,
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
                                    left: 59.w,
                                    right: 60.w,
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
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 24.h,
                                                  width: 18.w,
                                                  child: SvgPicture.asset(
                                                    'images/link.svg',
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
                                              fontSize: 15.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //copy
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 24.h,
                                                  width: 18.w,
                                                  child: SvgPicture.asset(
                                                    'images/bookmark.svg',
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
                                              fontSize: 15.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                'images/Dm.svg',
                                                height: 30.h,
                                                width: 20.w,
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
                                              fontSize: 15.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //whatsappp
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Image.asset(
                                                'images/facebook.png',
                                                height: 19.h,
                                                width: 20.w,
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
                                              fontSize: 15.sp,
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
                                    right: 60.w,
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
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 24.h,
                                                  width: 18.w,
                                                  child: SvgPicture.asset(
                                                    'images/gmail.svg',
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
                                              fontSize: 15.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //gmail
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                height: 24.h,
                                                width: 24.w,
                                                child: Image.asset(
                                                  'images/whatsapp.png',
                                                  height: 30.h,
                                                  width: 20.w,
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
                                              fontSize: 15.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Image.asset(
                                                'images/telegram.png',
                                                height: 24.h,
                                                width: 24.w,
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
                                              fontSize: 15.sp,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ), //telegram
                                    SizedBox(
                                      width: 35.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: bcolor3)
                                              // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                              // ),
                                              ),
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                  height: 24.h,
                                                  width: 30.w,
                                                  child: SvgPicture.asset(
                                                    'images/discord.svg',
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
                                              fontSize: 15.sp,
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
    }

    return ExpandableNotifier(
        child: Padding(
      padding: EdgeInsets.only(bottom: 10.h),
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
                  data: const ExpandableThemeData(),
                  child: Expandable(
                    collapsed: buildCollapsed1(),
                    expanded: buildExpanded1(),
                  ),
                ),
                Expandable(
                  collapsed: buildCollapsed2(),
                  expanded: buildExpanded1(),
                ),
                // Expandable(
                //   collapsed: buildCollapsed3(),
                //   expanded: buildExpanded3(),
                // ),
                Divider(
                  height: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  // Future<GetCommentModel> getComment() async {
  //   late GetCommentModel getCommentModel;
  //   String authority = 'beeperchat.herokuapp.com';
  //   String unencodedPath =
  //       '/beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0';

  //   final uri = Uri.https(authority, unencodedPath);
  //   String? userJwt = await SecureStorage.getToken();
  //   try {
  //     final response =
  //         await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       getCommentModel = GetCommentModel.fromJson(data);
  //     } else {
  //       throw "Unable to retrieve posts.";
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return getCommentModel;
  // }
}

Future<GetCommentModel> getComment(context) async {
  late GetCommentModel getCommentModel;
  String authority = 'beeperchat.herokuapp.com';
  String unencodedPath =
      '/beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0';

  final uri = Uri.https(authority, unencodedPath);
  String? userJwt = await SecureStorage.getToken();
  try {
    final response =
        await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      getCommentModel = GetCommentModel.fromJson(data);
    } else {
      throw "Unable to retrieve posts.";
    }
  } catch (e) {
    print(e.toString());
  }
  return getCommentModel;
}
