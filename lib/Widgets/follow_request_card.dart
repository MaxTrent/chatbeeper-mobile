import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class FollowRequestCard extends StatefulWidget {
  const FollowRequestCard({Key? key}) : super(key: key);

  @override
  State<FollowRequestCard> createState() => _FollowRequestCardState();
}

class _FollowRequestCardState extends State<FollowRequestCard> {
  String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String FullName = 'Sarah Madini';
  String sent = 'sent you a request';
  String posttime = '1 hour ago';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return SizedBox(
      height: 161.h, width: width,
      child:  Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
        ),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey),
            )
          ),
          child: Column(
            children: [
              SizedBox(height: 25.h,),
              Row(
                children: [
                  Image.asset('images/sarah.png', height: 50,),
                  SizedBox(width: 5.w,),
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
                          Text(sent, style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: Colors.grey , fontSize: 16.sp ),),
                        ],
                      ),
                      Text('\ $posttime', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w500, color: Colors.grey  ),),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 12.h),
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
              Padding(
                padding:  EdgeInsets.only(left: 65.w, right: 148.w,bottom: 20.h, top: 8.h),
                child: ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,width: 96.w,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: uColor,
                          splashFactory: NoSplash.splashFactory,
                          onSurface: Colors.transparent,
                        ),
                        onPressed: () {
                          // Perform some action
                        },
                        child:  Text('Decline', style: TextStyle(
                          color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                    SizedBox(width: 14.w,),
                    SizedBox(
                      height: 32.h,width: 96.w,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: bcolor1,
                          splashFactory: NoSplash.splashFactory,
                          onSurface: Colors.transparent,
                        ),
                        onPressed: () {
                          // Perform some action
                        },
                        child:  Text('Accept', style: TextStyle(
                            color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
