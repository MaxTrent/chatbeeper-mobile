import 'package:chat_beeper/Screens/colllection/timeline.dart';
import 'package:chat_beeper/Screens/drafts.dart';
import 'package:chat_beeper/data/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'beep_create.dart';

class ComposeBeep extends StatefulWidget {
  const ComposeBeep({Key? key}) : super(key: key);

  @override
  State<ComposeBeep> createState() => _ComposeBeepState();
}

class _ComposeBeepState extends State<ComposeBeep> {
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
    return Scaffold(
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
                        _beepController.text.isEmpty
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Timeline()))
                            : showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  // titlePadding: EdgeInsets.zero,
                                  // buttonPadding: EdgeInsets.zero,
                                  // contentPadding: EdgeInsets.zero,
                                  // actionsPadding:
                                  //     EdgeInsets.only(bottom: 30.h),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
                                  alignment: const Alignment(0, -1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.0.r))),
                                  actions: [
                                    SizedBox(
                                      width: 86.w,
                                      height: 39.13.h,
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
                                                  fontSize: 18.sp,
                                                  fontWeight:
                                                      FontWeight.w700),
                                            ),
                                          )),
                                    ), //cancel
                                    SizedBox(
                                      width: 9.24.w,
                                    ),
                                    SizedBox(
                                      width: 86.w,
                                      height: 39.13.h,
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
                                                  fontSize: 18.sp,
                                                  fontWeight:
                                                      FontWeight.w600),
                                            ),
                                          )),
                                    ), //save
                                  ],
                                  actionsAlignment: MainAxisAlignment.center,
                                  content: Text('Save Beep?',
                                  style: TextStyle(
                                      color: bcolor3,
                                      fontFamily: 'Nunito',
                                      fontSize: 20.sp,
                                      fontWeight:
                                      FontWeight.w700
                                  ),
                                  ),
                                  contentPadding: EdgeInsets.only(top: 10.h, left: 100.w),
                                  // content: Builder(
                                  //   builder: (context) {
                                  //     // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  //     var height = MediaQuery.of(context)
                                  //         .size
                                  //         .height;
                                  //     var width =
                                  //         MediaQuery.of(context).size.width;
                                  //
                                  //     return Column(
                                  //       // crossAxisAlignment: CrossAxisAlignment.center
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       children: [
                                  //         SizedBox(
                                  //           height: 10.h,
                                  //         ),
                                  //         Text(
                                  //           'Save Beep?',
                                  //           style: TextStyle(
                                  //               color: bcolor3,
                                  //               fontFamily: 'Nunito',
                                  //               fontSize: 20.sp,
                                  //               fontWeight:
                                  //                   FontWeight.w700),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5.h,
                                  //         ),
                                  //       ],
                                  //     );
                                  //   },
                                  // ),
                                ),
                              );
                        // FocusScope.of(context).unfocus();
                        //  TextEditingController().clear();
                        //  Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
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
                          child: Text(
                            'Drafts',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText2!
                                .copyWith(fontSize: 25.sp, color: bcolor3),
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
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  height: 250.h,
                  child: TextFormField(
                    controller: _beepController,
                    style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                        color: darkModeOn ? Colors.white : Colors.black),
                    autofocus: true,
                    maxLines: 10,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
                            color: Colors.transparent,
                          )),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
                            color: Colors.transparent,
                          )),
                      errorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
                            color: Colors.transparent,
                          )),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
                            color: Colors.transparent,
                          )),
                      // errorStyle: TextStyle(
                      //     height: 0, fontSize: 10.sp
                      // ),
                      hintText: "What\'s going on?",
                      hintStyle: Theme.of(context)
                          .primaryTextTheme
                          .bodyText2!
                          .copyWith(fontSize: 25.sp),
                      contentPadding: EdgeInsets.only(top: 10.h, left: 50.w),
                      // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                      focusColor: Colors.transparent,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            Container(
             height: 80.h,
                color: Colors.grey,
                child: document == null ? null : ClipRect(
                  child: Image.file(
                    document!,
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
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
                        onPressed: pickImage,
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: SizedBox(
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
                        onPressed: () {
                          createBeep(context, _beepController.text);
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
                                      color:
                                          darkModeOn ? bcolor1 : Colors.white),
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
                            darkModeOn
                                ? SvgPicture.asset(
                                    'images/paperplane blue.svg', height: 15.h,width: 10.w,)
                                : SvgPicture.asset('images/paperplane.svg',height: 15.h,width: 10.w,)
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

  File? document;

  Future pickImage() async {

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (image == null) return;
        final tempImage = File(image.path);
        setState(() {
          document = tempImage;
        });
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: Text('Filed to Pick image',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText1!
                  .copyWith(color: Colors.white)),
          backgroundColor: bcolor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 150.h,
              right: 20.w,
              left: 20.w),
        ),
      );
    }
  }
}
