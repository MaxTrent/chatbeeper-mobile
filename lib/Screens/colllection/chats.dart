import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/dm_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(428.w, 68.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: AppBar(
            // automaticallyImplyLeading: true,
            title: Padding(
                padding: EdgeInsets.only(top: 20.h, right: 9.w),
                child: RichText(
                  text: TextSpan(
                      text: 'Amber Lexy',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                      children: [
                        TextSpan(
                          text: ' @lexy4real',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: uColor),
                        ),
                      ]),
                )),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.h,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 28.0.w, right: 28.w),
              child: Container(
                height: 36.h,
                width: width,
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        label: Text(
                          'Type a message',
                          style: Theme.of(context).primaryTextTheme.bodyText1!,
                        ),
                      ),
                    ),
                  ),
                  darkModeOn
                      ? Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Color(0XFFF1F1F1),
                          ),
                          child: SvgPicture.asset(
                            'images/gallery.svg',
                            width: 10.w,
                            height: 10.h,
                          ))
                      : Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Color(0xffF1F1F1),
                          ),
                          child: SvgPicture.asset(
                            'images/gallery.svg',
                            width: 10.w,
                            height: 10.h,
                          )),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
