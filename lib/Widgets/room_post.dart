import 'package:chat_beeper/Widgets/room_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:like_button/like_button.dart';
import '../constants.dart';
import 'image_slider.dart';
class RoomCard extends StatelessWidget {
  String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String FullName = 'Sarah Madini';
  String username = 'Madini';
  String posttime = '1 hour ago';
  String bio = 'This is my bio';
  RoomCard({Key? key}) : super(key: key);
  static const String id = 'tour-card';

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
              padding: EdgeInsets.only(
                top: 10.h, bottom: 10.h, left: 10.w, right: 10.w,),
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
                                  style: Theme
                                      .of(context)
                                      .primaryTextTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text('@$username', style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),),
                                const Icon(
                                  Icons.verified_rounded, color: bcolor5,
                                  size: 15,),
                              ],
                            ),
                            Text('\ $posttime', style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),),
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: () {},
                          icon: Icon(Icons.more_vert_sharp, color: Theme
                              .of(context)
                              .colorScheme
                              .secondaryVariant, size: 30,),)
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
          SizedBox(
            height: 100.h,
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
                Padding(
                  padding:  EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: Text(bio,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Nunito'),
                  ),
                ),
              ],
            ),
          ),//avatar
          const RoomSlider(),
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
                    style: Theme
                        .of(context)
                        .primaryTextTheme
                        .bodyText1,
                  ),
                  Text(
                    "3 Expandable widgets",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
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
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    color: Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ExpandableTheme(
                          data: const ExpandableThemeData(),
                          child: Expandable(
                            collapsed: buildCollapsed2(),
                            expanded: buildExpanded1(),
                          ),
                        ),
                        // Expandable(
                        //   collapsed: buildCollapsed2(),
                        //   expanded: buildExpanded2(),
                        // ),
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
                ],
              ),
            ),
          ),
        ));
  }
}