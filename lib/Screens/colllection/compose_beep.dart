import 'package:chat_beeper/Screens/colllection/home_page.dart';
import 'package:chat_beeper/Screens/drafts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'beep_create.dart';

class ComposeBeep extends StatelessWidget {
  const ComposeBeep({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _beepController = TextEditingController();
    late final String _beep = _beepController.text;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    late var currentFocus;
    bool _leaving = false;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to go back?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 600.h,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, bottom: 10.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 20.h,
                          color: darkModeOn ? bcolor : bcolor,
                        ),
                        onTap: () {
                          showDialog(
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
                                    width: 63.38.w,
                                    height: 21.13.h,
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            backgroundColor: Colors.white),
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          // FocusScope.of(context).unfocus();
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Nunito',
                                              fontSize: 8.5.sp,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ), //cancel
                                  SizedBox(
                                    width: 9.24.w,
                                  ),
                                  SizedBox(
                                    width: 63.38.w,
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
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Nunito',
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ), //save
                                ],
                                actionsAlignment: MainAxisAlignment.center,
                                content: Builder(
                                  builder: (context) {
                                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                    var height =
                                        MediaQuery.of(context).size.height;
                                    var width =
                                        MediaQuery.of(context).size.width;

                                    return Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          'Save Beeps?',
                                          style: TextStyle(
                                              color: bcolor3,
                                              fontFamily: 'Nunito',
                                              fontSize: 16.sp,
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
                                        //         width: 63.38.w, height: 21.13.h,
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
                                        //         width: 63.38.w, height: 21.13.h,
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
                                        //               color: Colors.white, fontFamily: 'Nunito', fontSize: 9.sp,
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
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 30.w,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Drafts()));
                            },
                            child: const Text(
                              'Drafts',
                              style: TextStyle(color: bcolor3),
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0.r),
                      child: Image.asset(
                        'images/pp_round.png',
                        height: 30.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 360,
                  child: TextFormField(
                    controller: _beepController,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText2!
                        .copyWith(
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
                      hintText: "What\'s going on?",
                      hintStyle: Theme.of(context).primaryTextTheme.bodyText2,
                      contentPadding: EdgeInsets.only(top: 10.h, left: 50.w),
                      // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                      focusColor: Colors.transparent,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Container(
                        height: 40.h, width: 40.h,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
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
                    Container(
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
                    SizedBox(
                      width: width * 0.48,
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 106.w,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: darkModeOn == false
                                ? MaterialStateProperty.all(bcolor1)
                                : null,

                            // elevation: ,
                            shape: MaterialStateProperty.all<StadiumBorder>(
                                StadiumBorder(
                              side: BorderSide(
                                  color: darkModeOn
                                      ? bcolor1
                                      : Colors.transparent),
                            ))),
                        onPressed: () {},
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
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          darkModeOn ? bcolor1 : Colors.white),
                              // TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.w500,
                              //     fontFamily: 'Nunito',
                              //     fontSize: 16.sp
                              //
                              // ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              height: 20.h,
                              child: darkModeOn
                                  ? SvgPicture.asset(
                                      'images/paperplane blue.svg')
                                  : SvgPicture.asset('images/paperplane.svg'),
                            )
                          ],
                        ),
                      ),
                    ), //beep button
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
