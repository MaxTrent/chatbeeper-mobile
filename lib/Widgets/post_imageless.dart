import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_beeper/Widgets/comment.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostBeep extends StatelessWidget {
  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String FullName = 'Sarah Madini';
  String username = 'Madini';
  String posttime = '1 hour ago';
  PostBeep({Key? key}) : super(key: key);
  static const String id = 'post-card';
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
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
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(4.w, 8.w, 4.w, 12.h),
              child: SizedBox(
                height: 80.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey.shade200,
                      height: 28.h,
                      width: 105.w,
                      child: Center(
                        child: Text(
                          'Sponsored',
                          style: TextStyle(
                              color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey.shade800
                                  : Colors.black),
                              fontSize: 14.sp,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0.r),
                            child: Image.asset('images/sarah.png'),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\ $FullName\ ",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '@$username',
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
                            Text(
                              '\ $posttime',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert_sharp,
                            color:
                                Theme.of(context).colorScheme.secondaryVariant,
                            size: 30,
                          ),
                        )
                      ],
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
              left: 52.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ReadMoreText(
                  loremIpsum,
                  trimExpandedText: 'see Less',
                  trimCollapsedText: 'see more',
                  colorClickableText: Colors.grey,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
                ),
              ],
            ),
          ), //readmore text
          Container(
            height: 0.2,
            color: Colors.grey,
          ), //divider
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.grey,
                  icon: SvgPicture.asset(
                    'images/message.svg',
                    height: 25.h,
                    width: 25.w,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Comment()));
                  },
                ),
                LikeButton(
                  size: 24,
                  circleColor: CircleColor(
                      start: Colors.red.shade700, end: Colors.red.shade800),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red.shade700,
                    dotSecondaryColor: Colors.red.shade800,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false
                        ? SvgPicture.asset('images/Infinity.svg')
                        : SvgPicture.asset(
                            'images/infinity red.svg',
                          );
                  },
                  likeCount: 100,
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
                ), //infinite
                LikeButton(
                  size: 24,
                  circleColor: CircleColor(
                      start: Colors.red.shade700, end: Colors.red.shade800),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red.shade700,
                    dotSecondaryColor: Colors.red.shade800,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false
                        ? SvgPicture.asset('images/dislike.svg')
                        : SvgPicture.asset('images/dislike fill.svg');
                  },
                  likeCount: 100,
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
                LikeButton(
                  size: 24,
                  circleColor:
                      CircleColor(start: Colors.red.shade200, end: Colors.red),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.red,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false
                        ? SvgPicture.asset('images/like.svg')
                        : SvgPicture.asset('images/like fill.svg');
                  },
                  likeCount: 100,
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
                  width: 96.w,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0.h),
                  child: IconButton(
                    icon: Icon(
                      CupertinoIcons.share_up,
                      size: 24.h,
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            //icons
          ), //icons
        ],
      );
    } //image of card

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

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReadMoreText(
              loremIpsum,
            ),
          ],
        ),
      );
    } //useless

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
      ),
    ));
  }
}
