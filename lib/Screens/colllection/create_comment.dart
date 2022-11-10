import 'dart:convert';

import 'package:chat_beeper/Screens/colllection/timeline.dart';
import 'package:chat_beeper/data/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_beeper/constants.dart';
import 'package:http/http.dart' as http;
import '../../data/api_services.dart';
import '../comment_screen.dart';
import '../drafts.dart';

class CreateComment extends StatefulWidget {
  const CreateComment({Key? key}) : super(key: key);

  @override
  State<CreateComment> createState() => _CreateCommentState();
}

class _CreateCommentState extends State<CreateComment> {
  var username = 'markpetr';
  var _commentController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String comment = _commentController.text;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(width, 74.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: fColor2,
          ))),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 74.h,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            // centerTitle: true,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(top: 29.h, left: 2.w),
              child: GestureDetector(
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(color: fColor, fontSize: 25.sp),
                ),
                onTap: () {
                  _commentController.text.isEmpty
                      ? Navigator.pop(context)
                      : showDialog(
                          context: context,
                          builder: (ctx) => ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 64.h,
                              maxWidth: 257.w,
                            ),
                            child: AlertDialog(
                              titlePadding: EdgeInsets.zero,
                              buttonPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              actionsPadding: EdgeInsets.only(bottom: 9.h),
                              alignment: AlignmentDirectional.topCenter,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(100.0.r))),
                              actions: [
                                SizedBox(
                                  width: 68.w,
                                  height: 21.13.h,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          padding: EdgeInsets.zero,
                                          backgroundColor: Colors.white),
                                      onPressed: () {
                                        // FocusScope.of(context).unfocus();
                                        // TextEditingController().clear();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Nunito',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )),
                                ), //cancel
                                SizedBox(
                                  width: 9.24.w,
                                ),
                                SizedBox(
                                  width: 68.w,
                                  height: 21.13.h,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          backgroundColor: bcolor3),
                                      onPressed: () {
                                        // FocusScope.of(context).unfocus();
                                        // TextEditingController().clear();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Drafts()));
                                      },
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Nunito',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                ), //save
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                              content: Builder(
                                builder: (context) {
                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  var height =
                                      MediaQuery.of(context).size.height;
                                  var width = MediaQuery.of(context).size.width;

                                  return Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        'Save to Draft?',
                                        style: TextStyle(
                                            color: bcolor3,
                                            fontFamily: 'Nunito',
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      // Padding(
                                      //   padding:  EdgeInsets.only(bottom: 8.h),
                                      //   child: Row(
                                      //     // mainAxisAlignment: MainAxisAlignment.center,
                                      //     // mainAxisSize: MainAxisSize.min,
                                      //     children: [
                                      //       SizedBox(
                                      //         width: 68.w, height: 21.13.h,
                                      //         child:OutlinedButton(
                                      //             style: OutlinedButton.styleFrom(
                                      //                 shape: StadiumBorder(),
                                      //                 backgroundColor: Colors.white),
                                      //             onPressed: (){
                                      //               FocusScope.of(context).unfocus();
                                      //               TextEditingController().clear();
                                      //             }, child: Text('Cancel',
                                      //          style: TextStyle(
                                      //               color: Colors.black, fontFamily: 'Nunito', fontSize: 8.5.sp,
                                      //               fontWeight: FontWeight.w500
                                      //           ),
                                      //         )),
                                      //       ),//cancel
                                      //       SizedBox(
                                      //         width: 9.24.w,
                                      //       ),
                                      //       SizedBox(
                                      //         width: 68.w, height: 21.13.h,
                                      //         child:OutlinedButton(
                                      //             style: OutlinedButton.styleFrom(
                                      //                 shape: StadiumBorder(),
                                      //                 backgroundColor: bcolor3),
                                      //             onPressed: (){
                                      //               FocusScope.of(context).unfocus();
                                      //               TextEditingController().clear();
                                      //               Navigator.pop(context);
                                      //             }, child: Text('Save',
                                      //           style: TextStyle(
                                      //               color: Colors.white, fontFamily: 'Nunito', fontSize: 15.sp,
                                      //               fontWeight: FontWeight.w600
                                      //           ),
                                      //         )),
                                      //       ),//save
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                  // FocusScope.of(context).unfocus();
                  //  TextEditingController().clear();
                  //  Navigator.pop(context);
                  // Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 33.h),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: 600.h,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0.r),
                      child: Image.asset(
                        'images/pp_round.png',
                        height: 30.h,
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    RichText(
                        text: TextSpan(text: '', children: [
                      TextSpan(
                          text: 'Replying to',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2!
                              .copyWith(
                                color: fColor2,
                              )),
                      TextSpan(
                          text: ' @$username',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2!
                              .copyWith(color: fColor)),
                    ])),
                  ],
                ),
              ),
              Expanded(
                child: TextFormField(
                  key: _formKey,
                  controller: _commentController,
                  style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                      color: darkModeOn ? Colors.white : Colors.black),
                  autofocus: true,
                  maxLines: 10,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                          width: 0.5.w,
                          // color: _isvalid == true ? bcolor1: Colors.red),
                          color: Colors.transparent,
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                          width: 0.5.w,
                          // color: _isvalid == true ? bcolor1: Colors.red),
                          color: Colors.transparent,
                        )),
                    errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                          width: 0.5.w,
                          // color: _isvalid == true ? bcolor1: Colors.red),
                          color: Colors.transparent,
                        )),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                          width: 0.5.w,
                          // color: _isvalid == true ? bcolor1: Colors.red),
                          color: Colors.transparent,
                        )),
                    // errorStyle: TextStyle(
                    //     height: 0, fontSize: 10.sp
                    // ),
                    hintText: "Type a reply",
                    hintStyle: Theme.of(context)
                        .primaryTextTheme
                        .bodyText2!
                        .copyWith(fontSize: 25.sp),
                    contentPadding: EdgeInsets.only(top: 10.h, left: 20.w),
                    // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                    focusColor: Colors.transparent,
                    // focusColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                    child: Container(
                      height: 40.h, width: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.r)),
                        color: Colors.grey.shade200,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('images/gallery.svg'),
                        iconSize: 26.h,
                      ),
                      // SizedBox(
                      //     height: 26.h,
                      //     width: 26.w,
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Container(
                      height: 40.h, width: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.r)),
                        color: Colors.grey.shade200,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('images/lock-slash.svg'),
                        iconSize: 26.h,
                      ),
                      // SizedBox(
                      //     height: 26.h,
                      //     width: 26.w,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.48,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: SizedBox(
                      height: 40.h,
                      width: 106.w,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: darkModeOn == false
                                ? MaterialStateProperty.all(Colors.transparent)
                                : null,
                            side: MaterialStateProperty.all(
                                const BorderSide(color: bcolor1)),

                            // elevation: ,
                            shape: MaterialStateProperty.all<StadiumBorder>(
                                StadiumBorder(
                              side: BorderSide(
                                  color: darkModeOn ? bcolor1 : bcolor1),
                            ))),
                        onPressed: () {
                          createComment(context, _commentController.text);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Beep',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeOn ? bcolor1 : bcolor1),
                              // TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.w500,
                              //     fontFamily: 'Nunito',
                              //     fontSize: 17.sp
                              //
                              // ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              height: 20.h,
                              child: darkModeOn
                                  ? SvgPicture.asset(
                                      'images/paperplane blue.svg')
                                  : SvgPicture.asset(
                                      'images/paperplane blue.svg'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ), //beep button
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
