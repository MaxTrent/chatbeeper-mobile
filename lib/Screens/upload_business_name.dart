import 'package:chat_beeper/Screens/choose_username.dart';
import 'package:chat_beeper/Screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class UploadBname extends StatefulWidget {
  const UploadBname({Key? key}) : super(key: key);
  static const String id = 'upload-business';

  @override
  State<UploadBname> createState() => _UploadBnameState();
}

class _UploadBnameState extends State<UploadBname> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      backgroundColor: bcolor3,
      body: Form(
          key: _formKey,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.r),
                        topLeft: Radius.circular(40.r),
                      )
                      // borderRadius: BorderRadius.only( topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                      ),
                  height: 725.h,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 17.w, right: 17.w, bottom: 12.h, top: 12.h),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        children: [
                          //logo
                          SizedBox(
                            width: width,
                            height: 67.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(text: '', children: [
                                    TextSpan(
                                      text: 'Skip',
                                      style: TextStyle(
                                          color: bcolor1,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.sp),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ChooseUsername(),
                                                  ),
                                                ),
                                    ),
                                  ]),
                                ), //
                              ],
                            ),
                          ), //skip file
                          SizedBox(
                            height: 50.h,
                            width: 392.w,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 20.h, left: 10.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0.r),
                                  borderSide: BorderSide(width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                              ),
                              hint: Text(
                                'Select Document',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontFamily: 'Nunito',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                              items: <String>[
                                'CAC',
                                'International Passport',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Nunito',
                                        fontSize: 20.sp),
                                  ),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ), //select document
                          SizedBox(
                            height: 33.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 40,
                                  width: 155,
                                  child: Text(
                                    'JPG,JPEG or PNG only \n(MAX, 500KB)',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Ubuntu',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ), //jpg
                              SizedBox(
                                height: 39.h,
                                width: 136.59.w,
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey.shade500),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0.r),
                                          side: BorderSide(
                                              color: Colors.transparent),
                                        ))),
                                    onPressed: () {
                                      // pickImage();
                                    },
                                    child: Text(
                                      'Choose File',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline5!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500),
                                    )),
                              ) //choose
                            ],
                          ), //jpg and choose files
                          SizedBox(
                            height: 33.h,
                          ),
                          SizedBox(
                            height: 42.18.h,
                            width: 249.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade500
                                      // const Color(0xff386fa4)
                                      ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40.0.r),
                                      side: const BorderSide(
                                          color: Colors.transparent),
                                    ),
                                  )),
                              onPressed: () {
                                return null;
                                // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const UploadBname()
                                // )
                                // );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 6.w),
                                    child: Text(
                                      'Upload',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.cloud_upload,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ), //upload
                          ), //
                          Padding(
                            padding: EdgeInsets.only(bottom: 25.h, top: 125.h),
                            child: SizedBox(
                              height: 54.h,
                              width: 249.w,
                              child: Opacity(
                                opacity: 0.6,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(bcolor3),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0.r),
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                      ))),
                                  onPressed: () {
                                    return null;
                                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const ChooseUsername()
                                    // )
                                    // );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu',
                                        fontSize: 20.sp),
                                  ),
                                ),
                              ), //sign up
                            ),
                          ), //sign up
                          SizedBox(
                            height: 12.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(text: '', children: [
                                  TextSpan(
                                    text:
                                        'By creating an account you agree with our',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                  ),
                                ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(text: '', children: [
                                      TextSpan(
                                        text: 'Terms  of use',
                                        style: TextStyle(
                                            color: bcolor3,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.sp),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'and',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  RichText(
                                    text: TextSpan(text: '', children: [
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                            color: bcolor3,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 18.sp),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ],
                          ), //rich text
                          SizedBox(
                            width: 390.w,
                            height: 29.h,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 45.w, right: 30.w),
                                  child: Container(
                                    color: Colors.black,
                                    width: 100.w,
                                    height: 0.7.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: SizedBox(
                                      height: 28.h,
                                      width: 40.w,
                                      child: Center(
                                          child: Text(
                                        'or',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 24.sp,
                                            fontFamily: 'Ubuntu',
                                            fontWeight: FontWeight.w400),
                                      ))),
                                ),
                                Container(
                                  color: Colors.black,
                                  width: 110.w,
                                  height: 0.7.h,
                                ),
                              ],
                            ),
                          ), //or
                          SizedBox(
                            height: 48.h,
                            width: 111.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/google.png',
                                  height: 35.h,
                                  width: 35.w,
                                ),
                                SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        FontAwesomeIcons.facebookSquare,
                                        color: bcolor3,
                                        size: 30.h,
                                      ),
                                    ))
                              ],
                            ),
                          ), //google and fb
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(text: '', children: [
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.sp),
                                  ),
                                  TextSpan(
                                    text: ' Sign In',
                                    style: TextStyle(
                                        color: bcolor1,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => SignIn(),
                                            ),
                                          ),
                                  ),
                                ]),
                              ),
                            ],
                          ), //after sign up field
                        ],
                      ),
                    ),
                  ),
                ),
              ), //column field
              Positioned(
                top: 80.h,
                left: 90.w,
                child: Center(
                    child: Text(
                  'Create Your Business Account',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 22.sp),
                )),
              ), //main heading
              Positioned(
                top: 120.h,
                left: 140.w,
                child: Center(
                    child: Text(
                  'Please enter your details below',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline5!
                      .copyWith(fontSize: 15.sp),
                )),
              ), //subheading
              Positioned(
                top: 158.h,
                left: 190.w,
                child: Center(
                  child: Container(
                    height: 85.h,
                    width: 93.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'images/logo.png',
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ), //image
            ],
          )),
    );
  }
}
