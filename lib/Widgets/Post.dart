import 'package:chat_beeper/Widgets/comment.dart';
import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:chat_beeper/Widgets/rebeep_response.dart';
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
  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String FullName = 'Sarah Madini';
  String username = 'Madini';
  String posttime = '1 hour ago';

  final  bool _rebeeped = false;
  PostCard({Key? key}) : super(key: key);
  static const String id = 'post-card';
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
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
                left: 10.w,
                // right: 10.w,
              ),
              child: SizedBox(
                height: 60.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
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
                          Padding(
                            padding:  EdgeInsets.only(left: 15.w, bottom: 10.h),
                            child: PopupMenuButton<int>(

                              icon: Icon(Icons.more_vert_sharp, size: 30.h,color: Theme.of(context).colorScheme.secondaryVariant,),
                              iconSize: 24.h,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 1,
                                  // row has two child icon and text.
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 24.h, width: 24.w,
                                          child: darkModeOn == false? SvgPicture.asset('images/mute.svg'):SvgPicture.asset('images/mute.svg', color: Colors.white,)),
                                      SizedBox(width: 10.w,),
                                      Text("Mute",style:  TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),)
                                    ],
                                  ),
                                ),//mute
                                PopupMenuItem(
                                  value: 2,
                                  // row has two child icon and text.
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 24.h, width: 24.w,
                                          child:darkModeOn == false? SvgPicture.asset('images/block.svg'):SvgPicture.asset('images/block.svg', color: Colors.white,)),
                                      SizedBox(width: 10.w,),
                                      Text("Block", style:
                                      TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                      )
                                    ],
                                  ),
                                ),//block
                                PopupMenuItem(
                                  value: 3,
                                  // row has two child icon and text.
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 24.h, width: 24.w,
                                          child:darkModeOn == false? SvgPicture.asset('images/unfollow.svg'):SvgPicture.asset('images/unfollow.svg', color: Colors.white,)),
                                      SizedBox(width: 10.w,),
                                      Text("Unfollow", style:
                                      TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                      )
                                    ],
                                  ),
                                ),//unfollow
                                PopupMenuItem(
                                  value: 4,
                                  // row has two child icon and text.
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 24.h, width: 24.w,
                                          child:darkModeOn == false? SvgPicture.asset('images/not interested.svg'):SvgPicture.asset('images/not interested.svg', color: Colors.white,)),
                                      SizedBox(width: 10.w,),
                                      Text("Not interested in this", style:
                                      TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                      )
                                    ],
                                  ),
                                ),//not interested
                                PopupMenuItem(
                                  value: 5,
                                  // row has two child icon and text.
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 24.h, width: 24.w,
                                          child:darkModeOn == false? SvgPicture.asset('images/report.svg'):SvgPicture.asset('images/report.svg', color: Colors.white,)),
                                      SizedBox(width: 10.w,),
                                      Text("Report this account", style:
                                      TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                      )
                                    ],
                                  ),
                                ),//report
                              ],
                              offset: Offset(-28.w, 40.h),
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
          const ImageSlider(),
          Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 27.w, bottom: 12.h, top: 12.h),
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
          ),
          Container(
            height: 0.2.h,
            color: uColor,
          ), //divider
          Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 27.w, bottom: 12.h, top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'images/comment.svg',
                      height: 24.h,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Comment()));
                    },
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                GestureDetector(
                  onTap: () async{
                    showDialog(context: context, builder: (context)=>
                    const RebeepResponse(),
                    );
                  },
                  child: _rebeeped == false?  SizedBox(height:35.h,child: SvgPicture.asset('images/rebeep.svg', height: 30.h,)): SvgPicture.asset('images/rebeep.svg', color: Colors.red,  height: 35.h,),
                ),//rebeep //infinite
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  flex: 1,
                  child: LikeButton(
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
                  ),
                ), //brokenheart
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  flex: 1,
                  child: LikeButton(
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
                  ),
                ), //heart
                SizedBox(
                  width: 90.w,
                ),
                GestureDetector(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 5.h),
                    child: SvgPicture.asset('images/share.svg', height: 26.h,),
                  ),
                  onTap: (){
                    showModalBottomSheet(
                      useRootNavigator: true,
                      context: context, builder:(context)=>Container(
                      height: 336.h,
                      color: Theme.of(context).scaffoldBackgroundColor,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:   EdgeInsets.only(top: 6.h,),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(100.r),),
                              ),
                              height:5.h,
                              width: 45.w,
                            ),
                          ),//container
                          Padding(
                            padding:  EdgeInsets.only(left: 16.h, top: 6.h,),
                            child: Align(
                              alignment:Alignment.topLeft,
                              child: Text('Share Beep',style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                color: bcolor3,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,

                              ),),
                            ),
                          ),//share beep
                          Padding(
                            padding:  EdgeInsets.only(bottom: 0.h, left: 59.w, right: 60.w, top: 37.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: SizedBox(
                                            height: 24.h,
                                            width: 18.w,
                                            child: SvgPicture.asset('images/link.svg',)),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Copy Link', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),//copy
                                SizedBox(width: 35.w,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: SizedBox(
                                            height: 24.h,
                                            width: 18.w,
                                            child: SvgPicture.asset('images/bookmark.svg',)),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Save', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),
                                SizedBox(width: 35.w,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: SvgPicture.asset( 'images/Dm.svg', height: 30.h,width: 20.w, color: bcolor3,),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('DM', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),//whatsappp
                                SizedBox(width: 35.w,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: Image.asset('images/facebook.png', height: 19.h,width: 20.w,),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Facebook', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),//facebook
                              ],
                            ),
                          ),//icons 1
                          Padding(
                            padding:  EdgeInsets.only(bottom: 0.h, left: 59.w, right: 60.w, top: 37.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: SizedBox(
                                            height: 24.h,
                                            width: 18.w,
                                            child: SvgPicture.asset('images/gmail.svg',)),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Gmail', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),//gmail
                                SizedBox(width: 35.w,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: SizedBox(
                                          height: 24.h,
                                          width: 24.w,
                                          child:Image.asset('images/whatsapp.png', height: 30.h,width: 20.w,),
                                        ),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Whatsapp', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),
                                SizedBox(width: 35.w,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: Image.asset('images/telegram.png', height: 24.h,width: 24.w,),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Telegram', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),//telegram
                                SizedBox(width: 35.w,),
                                Column(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: bcolor3
                                          )
                                        // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                        // ),
                                      ),
                                      child: Center(child: GestureDetector(
                                        onTap: (){},
                                        child: SizedBox(
                                            height: 24.h,width: 30.w,
                                            child: SvgPicture.asset('images/discord.svg', )),
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Text('Discord', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                  ],
                                ),//discord
                              ],
                            ),
                          ),//icons 2
                        ],
                      ),
                    ),
                    );
                  },
                ),//share
              ],
            ), //icons
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
    } //lorem ipsum

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
