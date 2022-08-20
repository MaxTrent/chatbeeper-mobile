import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);
  static const String id = 'post-card';

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child:
      Scaffold(
        body:Column(
          children: [
            Container(
              height: 680.h,
              width: 473.w,
              padding: new EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), )
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //  ListTile(
                    //   leading: Padding(
                    //     padding: const EdgeInsets.only(top: 10),
                    //     child: Image.asset('images/Pp.png', height: 50.h,width: 50.w,),
                    //   ),
                    //   title: Row(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 15),
                    //         child: Text(
                    //             'Mark Peter',
                    //             style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w500, fontFamily: 'Nunito'),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 15),
                    //         child: Text(
                    //             ' @markpetr',
                    //             style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, fontFamily: 'Ubuntu')
                    //         ),
                    //       ),
                    //       SizedBox(width: 90.w,),
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 15),
                    //         child: Icon(Icons.more_vert_sharp, color: Colors.black,size: 30.h,),
                    //       ),
                    //     ],
                    //   ),
                    //   subtitle:Padding(
                    //     padding: const EdgeInsets.only(bottom: 10),
                    //     child: Text(
                    //         '10 Minutes ago',
                    //         style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: 'nunito')
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 16.h, right: 2.w),
                            child: Image.asset('images/Pp.png', height: 50.h,width: 50.w,),
                          ),//profile
                          SizedBox(
                            height: 51.h,
                            width: 226.w,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top: 1.h),
                                      child: Text('Mark Peter', style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w600,
                                        fontSize: 18.sp
                                      ),),
                                    ),
                                    SizedBox(width: 2,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('@markpetr', ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 15.h),
                                  child: Row(children: [Text('10 minutes ago', style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp
                                  ),)],),
                                ),
                              ],
                            ),
                          ),//mark
                          Padding(
                            padding:  EdgeInsets.only(left: 96.w),
                            child: IconButton(icon: Icon(Icons.more_vert_sharp, size: 32.h,), onPressed: () {  },
                            ),
                          )//more
                          
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset('images/pic.png',height: 306, width: 396, ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: bcolor3,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Wrap(children: [      Icon(CupertinoIcons.ellipses_bubble, color: bcolor5,size: 24.h,),],),
                              Wrap(children: [    Icon(CupertinoIcons.infinite, color: bcolor5,size: 24.h,),],),
                              Wrap(children: [ Icon(Icons.heart_broken, color: bcolor5,size: 24.h,),],),
                              Wrap(children: [ Icon(CupertinoIcons.heart, color: bcolor5,size: 24.h,),],),
                              Icon(CupertinoIcons.share_up, color: bcolor5,size: 24.h,),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            // Container(
            //   height: 200.h,
            //   width: 473.w,
            //   padding: new EdgeInsets.all(10.0),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), )
            //     ),
            //     color: Theme.of(context).scaffoldBackgroundColor,
            //     elevation: 5,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         ListTile(
            //           leading: Image.asset('images/Pp.png', height: 50.h,width: 50.w,),
            //           title: Row(
            //             children: [
            //               Text(
            //                 'Mark Peter',
            //                 style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w500, fontFamily: 'Nunito'),
            //               ),
            //               Text(
            //                   '@markpeter',
            //                   style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400, fontFamily: 'Ubuntu')
            //               ),
            //               Icon(Icons.verified_rounded, color: bcolor5,),
            //               SizedBox(width: 30.w,),
            //               Padding(
            //                 padding:  EdgeInsets.only(top: 15.h),
            //                 child: Icon(Icons.more_vert_sharp, color: Colors.black,size: 30.h,),
            //               ),
            //             ],
            //           ),
            //           subtitle:Text(
            //               '10 Minutes ago',
            //               style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: 'nunito')
            //           ),
            //         ),
            //         SizedBox(height: 10.h,),
            //         Text('A212943WEEREEHHRTHTRHHHRTHRT205tugjfbnjngj328356F952831)', textAlign: TextAlign.start,),
            //         Expanded(
            //           child: Align(
            //             alignment: Alignment.bottomCenter,
            //             child: Container(
            //               height: 40.h,
            //               decoration: BoxDecoration(
            //                   color: bcolor1,
            //                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), )
            //               ),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Wrap(children: [      Icon(CupertinoIcons.ellipses_bubble, color: bcolor5,size: 24.h,),],),
            //                   Wrap(children: [    Icon(CupertinoIcons.infinite, color: bcolor5,size: 24.h,),],),
            //                   Wrap(children: [ Icon(Icons.heart_broken, color: bcolor5,size: 24.h,),],),
            //                   Wrap(children: [ Icon(CupertinoIcons.heart, color: bcolor5,size: 24.h,),],),
            //                   Icon(CupertinoIcons.share_up, color: bcolor5,size: 24.h,),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //
            //
            //       ],
            //     ),
            //   ),
            // ),
          ],
        )

      ),

    )
    ;
  }
}
