import 'package:chat_beeper/Screens/colllection/chats.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DmList extends StatefulWidget {
  String name;
  String? username;
  String message;
  String imageURL;
  String time;
  bool isMessageOpened;
  DmList(
      {required this.name,
      this.username,
      required this.message,
      required this.imageURL,
      required this.time,
      required this.isMessageOpened});

  @override
  State<DmList> createState() => _DmListState();
}

class _DmListState extends State<DmList> {
  bool? isOnline;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: uColor,
      ))),
      child: ListTile(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => ChatScreen())),
        onLongPress: () {},
        dense: false,
        title: Column(
          children: [
            Row(
              children: [
                Stack(children: [
                  CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(widget.imageURL)),
                  ),
                  Positioned(
                    left: 32.w,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: isOnline == true
                              ? Color(0xff40F27B)
                              : Color(0xff9E9E9E),
                          border: Border.all(color: Color(0xffFCFCFC)),
                          borderRadius: BorderRadius.circular(100.r)),
                    ),
                  )
                ]),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0.h),
                      child: RichText(
                        text: TextSpan(
                            text: widget.name,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp),
                            children: [
                              TextSpan(
                                text: ' @${widget.username}',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp),
                              )
                            ]),
                      ),
                    ),
                    Text(
                      widget.message,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 5.5.h,
                    ),
                    Row(children: [
                      widget.isMessageOpened == false
                          ? Container()
                          : Container(
                              width: 25.w,
                              height: 24.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: bcolor1,
                              ),
                              child: Center(
                                  child: Text(
                                '2+',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Colors.white),
                              )),
                            ),
                      widget.isMessageOpened == false
                          ? Container()
                          : SizedBox(
                              width: 4.w,
                            ),
                      Text(
                        widget.time,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 16.sp),
                      )
                    ]),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),

        /*subtitle: Padding(
          padding: EdgeInsets.only(left: 60.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.message,
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 20.sp),
              ),
              SizedBox(
                height: 4,
              ),
              Row(children: [
                widget.isMessageOpened == false
                    ? Container()
                    : Container(
                        width: 25.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: bcolor1,
                        ),
                        child: Center(
                            child: Text(
                          '2+',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.white),
                        )),
                      ),
                widget.isMessageOpened == false
                    ? Container()
                    : SizedBox(
                        width: 4.w,
                      ),
                Text(
                  widget.time,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
                )
              ]),
            ],
          ),
        ),
      */
      ),
    );
  }
}
