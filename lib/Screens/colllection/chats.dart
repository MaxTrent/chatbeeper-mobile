import 'package:chat_beeper/Screens/colllection/message_screen.dart';
import 'package:chat_beeper/model/chatMessageModel.dart';
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
    List<ChatModel> chatContent = [
      ChatModel(
          message: Text(
            'Hello, how are you?',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1!
                .copyWith(fontSize: 22.sp),
          ),
          messageType: 'receiver',
          imageUrl: 'imageUrl',
          time: 'Sent 10:30pm'),
      ChatModel(
          message: Text(
            'I’m okay, wbu?',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1!
                .copyWith(fontSize: 22.sp),
          ),
          messageType: 'sender',
          imageUrl: 'imageUrl',
          time: 'Sent 10:30pm'),
      ChatModel(
          message: Text(
            'We missed you at the party\ntoday 😕',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1!
                .copyWith(fontSize: 22.sp),
          ),
          messageType: 'receiver',
          imageUrl: 'imageUrl',
          time: 'Sent 10:30pm'),
      ChatModel(
          message: Text(
            'Yeah, sorry about that lexy, had\nan emergency with nancy 😶',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1!
                .copyWith(fontSize: 22.sp),
          ),
          messageType: 'sender',
          imageUrl: 'imageUrl',
          time: 'Sent 10:30pm'),
      ChatModel(
          message: Container(
            width: 306.w,
            height: 280.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
            child: SvgPicture.asset(''),
          ),
          messageType: 'receiver',
          imageUrl: 'imageUrl',
          time: 'Sent 10:30pm'),
      ChatModel(
          message: Text(
            'You missed a lot!!! 😍😋',
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1!
                .copyWith(fontSize: 22.sp),
          ),
          messageType: 'receiver',
          imageUrl: 'imageUrl',
          time: 'Sent 10:30pm'),
    ];
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
            automaticallyImplyLeading: false,
            title: Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      child: ClipRRect(
                          //clipper: ,
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset('')),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    RichText(
                      text: TextSpan(text: '', children: [
                        TextSpan(
                            text: 'Amber Lexy',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp)),
                        TextSpan(
                          text: ' @lexy4real',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sp,
                                  color: uColor),
                        ),
                      ]),
                    ),
                  ],
                )),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            actions: [
              SizedBox(
                width: 20.w,
              )
            ],
            leading: Padding(
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
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: chatContent.length,
            shrinkWrap: true,
            //padding: ,
            itemBuilder: (context, index) => Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                  left: 28.w, right: 28.w, top: 10.h, bottom: 10.h),
              child: Align(
                child: chatContent[index].messageType == 'receiver'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0.h),
                            child: CircleAvatar(
                              radius: 20.r,
                              child: ClipRRect(
                                  //clipper: ,
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.asset('')),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xfff1f1f1),
                                  ),
                                  child: chatContent[index].message),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                chatContent[index].time,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xfff1f1f1),
                                  ),
                                  child: chatContent[index].message),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                chatContent[index].time,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 15.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.0.h),
                            child: CircleAvatar(
                              radius: 20.r,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.asset('')),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 26.0.w, right: 26.w),
              child: Container(
                height: 36.h,
                width: width,
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.black,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        label: Text(
                          'Type a message',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(fontSize: 25.sp),
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
                            color: Color(0xfff1f1f1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              'images/gallery.svg',
                              width: 20.w,
                              height: 10.h,
                              fit: BoxFit.fitHeight,
                            ),
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
