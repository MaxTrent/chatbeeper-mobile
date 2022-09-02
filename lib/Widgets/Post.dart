import 'package:chat_beeper/Widgets/comment.dart';
import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';
class PostCard extends StatelessWidget {
 String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
String FullName = 'Sarah Madini';
String username = 'Madini';
String posttime = '1 hour ago';
  PostCard({Key? key}) : super(key: key);
 static const String id = 'post-card';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize:const Size(485,926),
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
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h,left: 10.w,right: 10.w,),
              child: SizedBox(
                height: 60.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                                  style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text('@$username', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: Colors.grey  ),),
                                const Icon(Icons.verified_rounded, color: bcolor5,size: 15,),
                              ],
                            ),
                            Text('\ $posttime', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w500, color: Colors.grey  ),),
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_sharp, color: Theme.of(context).colorScheme.secondaryVariant, size: 30,), )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ]);//top of card
    }

    buildCollapsed2() {
      return Column(
        children: [
          const ImageSlider(),
          Padding(
            padding:  EdgeInsets.only(left: 16.w, right: 27.w,bottom: 12.h, top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ReadMoreText(
                  loremIpsum,
                  trimExpandedText: 'see Less',
                    trimCollapsedText: 'see more',
                    colorClickableText: Colors.grey,
                    style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),

                ),
              ],
            ),
          ),
          Container(
            height: 0.2.h,
            color: bcolor1,
          ),//divider
          Padding(
            padding:  EdgeInsets.only(left: 16.w, right: 27.w,bottom: 12.h, top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: SvgPicture.asset('images/comment.svg', height: 24,),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const Comment()));
                  },
                ),
                SizedBox(width: 30.w,),
                LikeButton(
                  size: 28,
                  circleColor:
                  CircleColor(start: Colors.red.shade700, end: Colors.red.shade800),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red.shade700,
                    dotSecondaryColor: Colors.red.shade800,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false? SvgPicture.asset(
                      'images/rebeep.svg',
                    ): SvgPicture.asset('images/rebeep_red.svg');
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
                ),//infinite
                SizedBox(width: 30.w,),
                LikeButton(
                  size: 24,
                  circleColor:
                  CircleColor(start: Colors.red.shade700, end: Colors.red.shade800),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red.shade700,
                    dotSecondaryColor: Colors.red.shade800,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false? SvgPicture.asset(
                      'images/dislike_blue.svg',
                    ): SvgPicture.asset('images/dislike_red.svg');
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
                ),//brokenheart
                SizedBox(width: 30.w,),
                LikeButton(
                  size: 24,
                  circleColor:
                  CircleColor(start: Colors.red.shade200, end: Colors.red),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.red,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked == false ? SvgPicture.asset(
                    'images/like.svg',
                    ): SvgPicture.asset('images/favorite_red.svg');
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
                ),//heart
                SizedBox(width: 90.w,),
                GestureDetector(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 5.h),
                    child: SvgPicture.asset('images/share.svg', height: 26,),
                  ),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const Comment()));
                  },
                ),
              ],),//icons
          ),//icons
        ],
      );
    }//image of card

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
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
              Expanded(child: buildImg(Colors.orange, 100)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: buildImg(Colors.lightBlue, 100)),
              Expanded(child: buildImg(Colors.cyan, 100)),
            ],
          ),
        ],
      );
    }

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
    }//lorem ipsum

    return ExpandableNotifier(
        child: Padding(
          padding:  EdgeInsets.only(bottom: 10.h),
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
                    ),
                    Expandable(
                      collapsed: buildCollapsed2(),
                      expanded: buildExpanded2(),
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
}

