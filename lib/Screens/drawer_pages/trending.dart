import 'package:chat_beeper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/search_delegate.dart';

List<String> searchTerms = [
  "@dhhdh",
  "@cjdvjvfj",
  "djjvj",
  "Pear",
  "Watdcjvjermelons",
  "Blueberries",
  "Pineapples",
  "Strawberries"
];
class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);
  static const String id = 'trending';
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
      appBar: PreferredSize(
        preferredSize: Size(428.w, 68.h),
        child: Padding(
          padding: EdgeInsets.only(top: 28.h),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: AppBar(
              title: Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: SizedBox(
                    height: 34.h,
                    width: 200.w,
                    child: SvgPicture.asset(
                      'images/chatbeeper_blue.svg',
                    )),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 23.h,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
      body:   CustomScrollView(
        controller: ScrollController(),
        slivers: [
          SliverToBoxAdapter(
            child:  Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: Searchdelegate());
                  },
                  child: Container(
                    height: 60.h,
                    width: width,
                    decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        )),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CupertinoSearchTextField(
                          decoration: BoxDecoration(
                            border: Border.all(color: uColor),
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          ),
                          prefixIcon: Transform.scale(
                              scale: 1.0,
                              child: SvgPicture.asset(
                                'images/search.svg',
                                color: darkModeOn ? Colors.white : Colors.black,
                              )),
                          prefixInsets:EdgeInsets.only(left: 10.h, right: 10.w),
                          placeholder: '#Search topic',
                          placeholderStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.grey
                          ),
                          onChanged: (value){

                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 17.h, left: 16.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Now Trending',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Nunito',
                            fontSize: 22.sp,
                            color: bcolor5),
                      ),
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
                                Text(
                                  "Change location",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      darkModeOn ? Colors.white : Colors.black),
                                )
                              ],
                            ),
                          ),
                          // popupmenu item 2
                          PopupMenuItem(
                            value: 2,
                            // row has two child icon and text.
                            child: Row(
                              children: [
                                Text(
                                  "Preferred gender",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      darkModeOn ? Colors.white : Colors.black),
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
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      darkModeOn ? Colors.white : Colors.black),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: CupertinoSwitch(
                                    value: false,
                                    onChanged: null,
                                    thumbColor: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                        offset: Offset(0, 40.h),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        elevation: 2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.h,)
              ],
            ),
          ),//search and now trending
           SliverGrid(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200.0,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 4.0,
    ),
      delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
    return SizedBox(
      height: 60.h,
      child: OutlinedButton(
        onPressed: () {
         // Navigator.of(context, rootNavigator: true).pop();
         // FocusScope.of(context).unfocus();
       },
       style: ButtonStyle(
       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.r),
      side: const BorderSide(color: Colors.transparent),
      )),
      ),
        child: Column(
          children: [
            Text(
        'Cancel',
        style: Theme.of(context)
        .primaryTextTheme
        .bodyText2!
        .copyWith(color: fColor, fontSize: 16.sp),
      ),
            Text(
              'Cancel',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText2!
                  .copyWith(color: fColor, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
    },
    childCount: 20,
    ),
    ),
          // SliverFixedExtentList(
          //   itemExtent: 50.0,
          //   delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.lightBlue[100 * (index % 9)],
          //         child: Text('List Item $index'),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
      // Column(
      //   children: [
      //     SizedBox(
      //       height: 10.h,
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         showSearch(context: context, delegate: Searchdelegate());
      //       },
      //       child: Container(
      //         height: 60.h,
      //         width: width,
      //         decoration: const BoxDecoration(
      //             border: Border(
      //           bottom: BorderSide(color: Colors.grey),
      //         )),
      //         child: SizedBox(
      //           child: Padding(
      //             padding: const EdgeInsets.all(8),
      //             child: CupertinoSearchTextField(
      //               decoration: BoxDecoration(
      //                 border: Border.all(color: uColor),
      //                 borderRadius: BorderRadius.all(Radius.circular(16.r)),
      //               ),
      //               prefixIcon: Transform.scale(
      //                   scale: 1.0,
      //                   child: SvgPicture.asset(
      //                     'images/search.svg',
      //                     color: darkModeOn ? Colors.white : Colors.black,
      //                   )),
      //               prefixInsets:EdgeInsets.only(left: 10.h, right: 10.w),
      //               placeholder: '#Search topic',
      //               placeholderStyle: TextStyle(
      //                 fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.grey
      //               ),
      //             onChanged: (value){
      //
      //             },
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 17.h, left: 16.w, right: 20.w),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Now Trending',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w600,
      //                 fontFamily: 'Nunito',
      //                 fontSize: 22.sp,
      //                 color: bcolor5),
      //           ),
      //           PopupMenuButton<int>(
      //             icon: SvgPicture.asset('images/setting-4.svg'),
      //             iconSize: 24.h,
      //             itemBuilder: (context) => [
      //               // popupmenu item 1
      //               PopupMenuItem(
      //                 value: 1,
      //                 // row has two child icon and text.
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       "Change location",
      //                       style: TextStyle(
      //                           fontFamily: 'Nunito',
      //                           fontSize: 18.sp,
      //                           fontWeight: FontWeight.w500,
      //                           color:
      //                               darkModeOn ? Colors.white : Colors.black),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               // popupmenu item 2
      //               PopupMenuItem(
      //                 value: 2,
      //                 // row has two child icon and text.
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       "Preferred gender",
      //                       style: TextStyle(
      //                           fontFamily: 'Nunito',
      //                           fontSize: 18.sp,
      //                           fontWeight: FontWeight.w500,
      //                           color:
      //                               darkModeOn ? Colors.white : Colors.black),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               PopupMenuItem(
      //                 value: 3,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       'Lock your room',
      //                       style: TextStyle(
      //                           fontFamily: 'Nunito',
      //                           fontSize: 18.sp,
      //                           fontWeight: FontWeight.w500,
      //                           color:
      //                               darkModeOn ? Colors.white : Colors.black),
      //                     ),
      //                     Transform.scale(
      //                       scale: 0.7,
      //                       child: CupertinoSwitch(
      //                         value: false,
      //                         onChanged: null,
      //                         thumbColor: Colors.grey.shade500,
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ],
      //             offset: Offset(0, 40.h),
      //             color: Theme.of(context).scaffoldBackgroundColor,
      //             elevation: 2,
      //           )
      //         ],
      //       ),
      //     ),
      //     // GridView.count(
      //     //   physics: ScrollPhysics(),
      //     //   crossAxisSpacing: 2.0,
      //     //   mainAxisSpacing: 2.0,
      //     //   scrollDirection: Axis.vertical,
      //     //   crossAxisCount: 3,
      //     //   childAspectRatio: (1 / .4),
      //     //   shrinkWrap: true,
      //     //   children: List.generate(6, (index) {
      //         return Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: Container(
      //             child: SizedBox(
      //               width: 138.w,
      //               height: 58.h,
      //               child: OutlinedButton(
      //                   style: OutlinedButton.styleFrom(
      //                     shape: StadiumBorder(),
      //                   ),
      //                   onPressed: () {
      //                     Navigator.of(context, rootNavigator: true).pop();
      //                     // FocusScope.of(context).unfocus();
      //                   },
      //                   child: Text(
      //                     'Cancel',
      //                     style: Theme.of(context)
      //                         .primaryTextTheme
      //                         .bodyText2!
      //                         .copyWith(color: fColor),
      //                   )),
      //             ),
      //           ),
      //         );
      //     //   }),
      //     // ),
      //   ],
      // ),
    );
  }
}
