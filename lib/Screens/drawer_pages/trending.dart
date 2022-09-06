import 'package:chat_beeper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/search_delegate.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      final orientation = MediaQuery.of(context).orientation;
      var brightness = MediaQuery.of(context).platformBrightness;
      bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size(428.w,68.h),
        child: Padding(
          padding:  EdgeInsets.only( top: 28.h),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey)
                )
            ),
            child: AppBar(
              // automaticallyImplyLeading: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('images/logo1.png', height: 32.h,),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
                Navigator.pop(context);
              },)),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          GestureDetector(
            onTap: (){
              showSearch(context: context, delegate: Searchdelegate());
            },
            child: Container(
              height: 80.h, width: width,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                )
              ),
          child:     SizedBox(
            child: Padding(
              padding:  EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior:
                  FloatingLabelBehavior.auto,
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30.r)),
                      borderSide: BorderSide(
                        width: 0.5.w,
                        // color: _isvalid == true ? bcolor1: Colors.red),
                        color: bcolor1,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30.r)),
                    borderSide:
                    BorderSide(width: 0.5.w, color: uColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30.r)),
                    borderSide: BorderSide(
                        width: 0.5.w, color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30.r)),
                    borderSide: BorderSide(
                        width: 0.5.w, color: Colors.red),
                  ),
                  errorStyle:
                  TextStyle(height: 0, fontSize: 10.sp),
                  hintText: '#Search topic',
                  hintStyle: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2,
                  contentPadding:
                  EdgeInsets.only(top: 10.h, left: 10.w),
                  prefixIcon: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset('images/search.svg', color: darkModeOn? Colors.white: Colors.black,)),
                  // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                  focusColor: uColor,
                  // focusColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 17.h, left: 16.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Now Trending', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Nunito', fontSize: 16.sp, color: bcolor5),),
                PopupMenuButton<int>(

                  icon: SvgPicture.asset('images/setting-4.svg'),
                  iconSize: 24.h,
                  itemBuilder: (context) => [
                    // popupmenu item 1
                    PopupMenuItem(
                      value: 1,
                      // row has two child icon and text.
                      child: Row(
                        children: [
                          Text("Change location",style:  TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),)
                        ],
                      ),
                    ),
                    // popupmenu item 2
                    PopupMenuItem(
                      value: 2,
                      // row has two child icon and text.
                      child: Row(
                        children: [
                          Text("Preferred gender", style:
                          TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lock your room',
                            style:
                            TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                          ),
                          Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(value: false, onChanged: null,
                              thumbColor: Colors.grey.shade500,
                            ),
                          )
                        ],
                      ),),

                  ],
                  offset: Offset(0, 40.h),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 2,
                )
              ],
            ),
          ),//now Trending and settings
          // ListView.separated(
          //   separatorBuilder:  ((context, index) =>  SizedBox(
          //     width: 33.h,
          //   )),
          //   itemCount: 10,
          //   itemBuilder: (BuildContext context, int index) {
          //     return   Row(
          //       children: [
          //         SizedBox(
          //           height: 460.h,
          //           child: SizedBox(
          //             height: 58.h,
          //             child: ListView.separated(
          //               scrollDirection: Axis.horizontal,
          //               itemCount: 20,
          //               separatorBuilder:  ((context, index) =>  SizedBox(
          //                 width: 8.w,
          //               )),
          //               itemBuilder: (BuildContext context, int index) {
          //                 return Row(
          //                   children: [
          //                     ClipRRect(
          //                       borderRadius: BorderRadius.circular(100.0.r),
          //                       child: Image.asset('images/pp_round.png', height: 60.h, width: 60.w,),
          //                     ),
          //                   ],
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
      GridView.count(
        physics: ScrollPhysics(),
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: (1 / .4),
        shrinkWrap: true,
        children: List.generate(6, (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(

              child: SizedBox(
                width:138.w, height: 58.h,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    onPressed: (){
                      Navigator.of(context, rootNavigator: true).pop();
                      // FocusScope.of(context).unfocus();
                    }, child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Nunito', fontSize: 8.5.sp,
                      fontWeight: FontWeight.w500
                  ),
                )),
              ),
            ),
          );
        }),
      ),
        ],
      ),
    );
  }
}
