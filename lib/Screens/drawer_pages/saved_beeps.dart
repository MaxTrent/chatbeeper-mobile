import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/sponsored_tour_card.dart';
import 'package:chat_beeper/Widgets/tour_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/post_imageless.dart';
import '../../Widgets/room_post.dart';
import '../../constants.dart';

class SavedBeeps extends StatefulWidget {
  const SavedBeeps({Key? key}) : super(key: key);

  @override
  State<SavedBeeps> createState() => _SavedBeepsState();
}

class _SavedBeepsState extends State<SavedBeeps> {
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
              // automaticallyImplyLeading: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text('Saved Beeps',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4!
                        .copyWith(fontSize: 25.sp)),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: Center(
                  child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 23.h,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clear all',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                        fontSize: 17.sp,
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
            ), //clear all and settings
            SizedBox(
              height: 700.h,
              // width: 368.w,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      PostBeep(),
                      const SponsoredTourCard(),
                      PostCard(),
                      TourCard()
                    ],
                  );
                },
              ),
            ), //listview
          ],
        ),
      ),
    );
  }
}
