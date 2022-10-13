import 'dart:convert';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_beeper/Screens/choose_username.dart';
import 'package:chat_beeper/Screens/otp_email.dart';
import 'package:chat_beeper/Screens/otp_number.dart';
import 'package:chat_beeper/Screens/sign_in.dart';
import 'package:chat_beeper/Screens/upload_business_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/gestures.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:http/http.dart' as http;

import '../model/SignUp_Model.dart';
import '../model/SignUp_Model.dart';
import 'colllection/settings_page.dart';

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z]");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidUname {
    final nameRegExp = RegExp(
        r"^[a-zA-Z0-9-_]([._-](?![._-])|[a-zA-Z0-9]){3,12}[a-zA-Z0-9-_]$"); //username is 8-20 characters long
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$'); //minimum 8 char
    return passwordRegExp.hasMatch(this);
  }

  // bool get isNotNull{
  //   return this!=null;
  // }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  static const String id = 'Create-account';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var _pageController = PageController();
  final format = DateFormat("dd/MM/yyyy");
  String? email;
  DateTime? birthday;
  String? password;
  String? fullname;
  String? gender;
  String? phone;
  String? username;
  String dropdownValue = 'Male';
  bool _visible = false;
  bool _isvalid = false;
  bool _expanded = false;
  String get emailController => _emailTextController.text.toString();

  int _selectedgender = 0;
  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final formKeyy = GlobalKey<FormState>();
  var _emailTextController = TextEditingController();
  var _passwordTextController = TextEditingController();
  var _cpasswordTextController = TextEditingController();
  var _birthdateControlller = TextEditingController();
  var _phoneTextController = TextEditingController();
  var lnameTextController = TextEditingController();
  var _fnameTextController = TextEditingController();
  var _chooseusername = TextEditingController();
  int _currentPage = 1;

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'JaneDoe';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

// @override
  // void initState() {
  //   super.initState();
  //   _pageController.addListener(() {
  //     if (_pageController.page!.round() != _currentPage) {
  //       setState(() {
  //         _currentPage = _pageController.page!.round();
  //       });
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final firstDate = DateTime(DateTime.now().year - 120);
    final lastDate = DateTime.now();
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: PageView(
        allowImplicitScrolling: false,
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        // onPageChanged: (num) async{ // what will happen when you switch
        //   setState(() { // Update state
        //     _currentPage = num; // Set the page we're on to the num argument
        //   });
        // },
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 108.h,
                    ),
                    Center(
                        child: Image.asset(
                      'images/logo1.png',
                      height: 90.h,
                      width: 90.w,
                    )),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Create an account',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 32.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w, right: 28.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 8.r,
                            foregroundColor: Colors.black,
                            backgroundColor: bcolor3,
                          ),
                          Container(
                            height: 0.5.h,
                            width: 158.w,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          CircleAvatar(
                            maxRadius: 8.r,
                            backgroundColor: Color(0xffD1E1EF),
                          ),
                          Container(
                            height: 0.5.h,
                            width: 155.w,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          CircleAvatar(
                            maxRadius: 8.r,
                            backgroundColor: Color(0xffD1E1EF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SizedBox(
                      width: 372.w,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 372.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                )
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val!.length < 3 || val.isEmpty) {
                                  return 'Enter a valid First name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _fnameTextController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                hintText: 'First Name',
                                labelText: 'First Name',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                focusColor: uColor,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //first name
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 372.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                )
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val!.length < 3 || val.isEmpty) {
                                  return 'Enter a valid last name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: lnameTextController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                hintText: 'Last Name',
                                labelText: 'Last Name',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                focusColor: uColor,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //lastname
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 372.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _emailTextController,
                              validator: (val) {
                                if (!val!.isValidEmail || val.isEmpty) {
                                  return 'Enter valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                labelText: 'Email Address',
                                hintText: 'Email Address',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15.sp),
                                // _isvalid == true ? Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 15.sp):
                                // Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 15.sp, color: Colors.red),
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                focusColor: uColor,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //email
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 372.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                ),
                              ],
                              validator: (val) {
                                if (val!.isValidPhone ||
                                    val.isEmpty ||
                                    val.length > 10 ||
                                    val.length < 10) {
                                  return 'Enter a valid phone number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _phoneTextController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10.0.w),
                                  child: CountryCodePicker(
                                    barrierColor: Colors.grey,
                                    backgroundColor: CupertinoColors.systemGrey,
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: '+234',
                                    favorite: const ['+234', 'NG'],
                                    textStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                    showFlag: false,
                                    boxDecoration: BoxDecoration(
                                      border:
                                          Border.all(width: 1.w, color: uColor),
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),

                                    //showFlagDialog: true,
                                    //comparator: (a, b) => b.name.compareTo(a.name),
                                    //Get the country information relevant to the initial selection
                                    //onInit: (code) => print("${code.name} ${code.dialCode}"),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                labelText: 'Phone Number',
                                hintText: 'Phone Number',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15.sp),
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                focusColor: uColor,
                              ),
                            ),
                          ), //phone
                          SizedBox(
                            height: 40.h,
                          ),
                          SizedBox(
                            height: 54.h,
                            width: 400.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (_phoneTextController.text.isEmpty ||
                                        _emailTextController.text.isEmpty ||
                                        _fnameTextController.text.isEmpty) {
                                      return Color(0xffD8D8D8);
                                    }
                                    return bcolor1;
                                  }),

                                  // elevation: ,
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                  ))),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print(
                                      '${_phoneTextController.text.toString()}, ${_phoneTextController.text.toString()}, ${lnameTextController.text.toString()},${_fnameTextController.text.toString()}');
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.easeIn);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Registration Incomplete',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.white)),
                                      backgroundColor: bcolor,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              150.h,
                                          right: 20.w,
                                          left: 20.w),
                                    ),
                                  );
                                }
                                return;
                                // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const ConfirmRegister(),
                                // )
                                // );
                              },
                              child: Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3!
                                    .copyWith(fontSize: 17.sp),
                                // TextStyle(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w500,
                                //     fontFamily: 'Nunito',
                                //     fontSize: 17.sp
                                //
                                // ),
                              ),
                            ),
                          ), //button
                          SizedBox(
                            height: 24.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(text: '', children: [
                                  TextSpan(
                                    text:
                                        'By creating an account you agree with our',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
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
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //page 1

          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 108.h,
                    ),
                    Center(
                        child: Image.asset(
                      'images/logo1.png',
                      height: 90.h,
                      width: 90.w,
                    )),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Create an account',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 32.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w, right: 28.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 10.r,
                            foregroundColor: Colors.black,
                            backgroundColor: bcolor3,
                            child: Center(
                              child: const Icon(
                                Icons.check_sharp,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                          ),
                          Container(
                            height: 0.5.h,
                            width: 158.w,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          ),
                          CircleAvatar(
                            maxRadius: 8.r,
                            backgroundColor: bcolor3,
                          ),
                          Container(
                            height: 0.5.h,
                            width: 155.w,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          CircleAvatar(
                            maxRadius: 8.r,
                            backgroundColor: Colors.blue.shade100,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SizedBox(
                      height: 600.h,
                      width: 372.w,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 372.w,
                            child: DateTimeField(
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _birthdateControlller,
                              validator: (val) {
                                if (_birthdateControlller.text.isEmpty) {
                                  return 'Date of birth is Empty';
                                }
                                setState(() {
                                  val = birthday;
                                });
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: SvgPicture.asset(
                                  'images/calendar.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15.sp),
                                hintText: 'Date of Birth',
                                labelText: 'Date of Birth',
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                focusColor: uColor,
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                              format: format,
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    currentDate: currentValue ?? DateTime.now(),
                                    firstDate: DateTime(1900),
                                    initialDate: DateTime(2004),
                                    lastDate: DateTime(2101));
                              },
                            ),
                          ), //date of birth
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTileTheme(
                                  data: ListTileThemeData(
                                    selectedColor: bcolor1,
                                    iconColor:
                                        _selectedgender == 1 ? bcolor1 : uColor,
                                    textColor:
                                        _selectedgender == 1 ? bcolor1 : uColor,
                                  ),
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 175.w,
                                    child: ListTile(
                                      horizontalTitleGap: 0,
                                      minVerticalPadding: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        side: BorderSide(
                                            color: _selectedgender == 1
                                                ? bcolor1
                                                : uColor,
                                            width: 1.w),
                                      ),
                                      leading: Padding(
                                        padding: EdgeInsets.only(
                                          left: 8.0.w,
                                        ),
                                        child: const Icon(
                                          Icons.male,
                                          size: 20,
                                        ),
                                      ),
                                      title: Text(
                                        'Male',
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 17.sp,
                                          color: _selectedgender == 1
                                              ? bcolor1
                                              : uColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          // set current index!
                                          _selectedgender = 1;
                                          gender = 'Male';
                                          print(gender);
                                        });
                                      },
                                      selectedColor: bcolor5,
                                    ),
                                  ),
                                ), //male
                                SizedBox(
                                  width: 16.w,
                                ),
                                ListTileTheme(
                                  data: ListTileThemeData(
                                    selectedColor: bcolor1,
                                    iconColor:
                                        _selectedgender == 2 ? bcolor1 : uColor,
                                    textColor:
                                        _selectedgender == 2 ? bcolor1 : uColor,
                                  ),
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 175.w,
                                    child: ListTile(
                                      horizontalTitleGap: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        side: BorderSide(
                                            color: _selectedgender == 2
                                                ? bcolor1
                                                : uColor,
                                            width: 1),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          // set current index!
                                          _selectedgender = 2;
                                          gender = 'Female';
                                          print(gender);
                                        });
                                      },
                                      leading: Padding(
                                        padding: EdgeInsets.only(
                                          left: 8.0.w,
                                        ),
                                        child: Icon(
                                          Icons.female,
                                          size: 20.h,
                                        ),
                                      ),
                                      title: Text(
                                        'Female',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Nunito',
                                          fontSize: 17.sp,
                                          color: _selectedgender == 2
                                              ? bcolor1
                                              : uColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ), //female
                              ],
                            ),
                          ), //gender
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 372.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val!.isValidPassword)
                                  return 'Enter valid password';
                                if (!val.isValidPassword) {
                                  password = val;
                                }
                                if (val.isEmpty || val.length < 6) {
                                  print('$val is incorrect');
                                  return 'Password has to be atleast 6 characters long. try again';
                                }
                                return null;
                              },
                              obscureText: _visible == false ? true : false,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                suffixIcon: IconButton(
                                  color: Colors.black,
                                  icon: _visible
                                      ? IconTheme(
                                          data: Theme.of(context).iconTheme,
                                          child: Icon(
                                            Icons.visibility_outlined,
                                            size: 18.h,
                                          ))
                                      : IconTheme(
                                          data: Theme.of(context).iconTheme,
                                          child: Icon(
                                            Icons.visibility_off_outlined,
                                            size: 18.h,
                                          )),
                                  onPressed: () {
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  },
                                ),
                                hintText: 'Password',
                                labelText: 'Password',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15.sp),
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                focusColor: bcolor3,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //password
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 372.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val != password) {
                                  return 'Passwords are different. try again';
                                }
                                if (val!.isEmpty || val.length < 6) {
                                  return 'Password has to be atleast 6 characters long. try again';
                                }
                                // setState(() {
                                //   print(password);
                                // });
                                // return null;
                              },
                              obscureText: _visible == false ? true : false,
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _cpasswordTextController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 0.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: bcolor1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:
                                      BorderSide(width: 0.5.w, color: uColor),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                      width: 0.5.w, color: Colors.red),
                                ),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                                suffixIcon: IconButton(
                                  color: Colors.black,
                                  icon: _visible
                                      ? IconTheme(
                                          data: Theme.of(context).iconTheme,
                                          child: Icon(
                                            Icons.visibility_outlined,
                                            size: 18.h,
                                          ))
                                      : IconTheme(
                                          data: Theme.of(context).iconTheme,
                                          child: Icon(
                                            Icons.visibility_off_outlined,
                                            size: 18.h,
                                          )),
                                  onPressed: () {
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  },
                                ),
                                hintText: 'Confirm Password',
                                labelText: 'Confirm Password',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 15.sp),
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                focusColor: bcolor3,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //confirm password
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 54.h,
                            width: 400.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (_passwordTextController.text.isEmpty ||
                                        _cpasswordTextController.text.isEmpty ||
                                        _birthdateControlller.text.isEmpty ||
                                        gender == null) return uColor;
                                    return bcolor1;
                                  }),

                                  // elevation: ,
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                  ))),
                              onPressed: () async {
                                if (formKey.currentState!.validate() &&
                                        gender == 'Male' ||
                                    gender == 'Female') {
                                  print(
                                      '${_phoneTextController.text.toString()}, ${_birthdateControlller.text}, $gender,${_passwordTextController.text.toString()}');
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.easeIn);
                                } else if (gender != 'male' ||
                                    gender != 'female' ||
                                    _birthdateControlller.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Registration Incomplete',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.white)),
                                      backgroundColor: bcolor,
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              150.h,
                                          right: 20.w,
                                          left: 20.w),
                                    ),
                                  );
                                }

                                return;
                                // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const ConfirmRegister(),
                                // )
                                // );
                              },
                              child: Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3!
                                    .copyWith(fontSize: 17.sp),
                                // TextStyle(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w500,
                                //     fontFamily: 'Nunito',
                                //     fontSize: 17.sp
                                //
                                // ),
                              ),
                            ),
                          ), //button
                          SizedBox(
                            height: 22.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(text: '', children: [
                                  TextSpan(
                                    text:
                                        'By creating an account you agree with our',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
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
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //page 2

          SingleChildScrollView(
            child: Form(
              key: formKeyy,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 108.h,
                    ),
                    Center(
                        child: Image.asset(
                      'images/logo1.png',
                      height: 90.h,
                      width: 90.w,
                    )),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Create an account ',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 32.sp),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w, right: 28.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 10.r,
                            foregroundColor: Colors.black,
                            backgroundColor: bcolor3,
                            child: const Center(
                              child: Icon(
                                Icons.check_sharp,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                          ),
                          Container(
                            height: 0.5.h,
                            width: 158.w,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          ),
                          CircleAvatar(
                            maxRadius: 10.r,
                            foregroundColor: Colors.black,
                            backgroundColor: bcolor3,
                            child: const Center(
                              child: Icon(
                                Icons.check_sharp,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                          ),
                          Container(
                            height: 0.5.h,
                            width: 155.w,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          ),
                          _isvalid == true
                              ? CircleAvatar(
                                  maxRadius: 10.r,
                                  backgroundColor: bcolor3,
                                  child: const Center(
                                    child: Icon(
                                      Icons.check_sharp,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                  ),
                                )
                              : CircleAvatar(
                                  maxRadius: 10.r,
                                  backgroundColor: bcolor3,
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SizedBox(
                      height: 600.h,
                      width: 372.w,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Create  a username',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                              )),
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 372.w,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  primaryColor: uColor,
                                  iconTheme: Theme.of(context)
                                      .iconTheme
                                      .copyWith(color: uColor)),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Username has to be atleast 5-20 characters long or. try again';
                                  }
                                  if (!value!.isValidUname) {
                                    return 'Invalid Username';
                                  }
                                  if (value == 'JaneDoe' ||
                                      value == 'chatbeeper') {
                                    return 'This username is unavailable. Please try another. ';
                                  }
                                  if (value.isValidUname) {
                                    _isvalid = true;
                                    _visible = true;
                                  }
                                  return null;
                                },
                                // onFieldSubmitted: (value){
                                //   setState(() {
                                //     username=value;
                                //     print(username);
                                //   });
                                // },
                                // onChanged: (value){
                                //   setState(() {
                                //
                                //   });
                                // },
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 17.sp),
                                controller: _chooseusername,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.r)),
                                      borderSide: BorderSide(
                                        width: 1.5.w,
                                        // color: _isvalid == true ? bcolor1: Colors.red),
                                        color: uColor,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 1.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: uColor,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 1.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: uColor,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                      width: 1.5.w,
                                      // color: _isvalid == true ? bcolor1: Colors.red),
                                      color: uColor,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    height: 0,
                                    fontSize: 12.sp,
                                    color: Colors.red,
                                  ),
                                  labelStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                  hintStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 15.sp),
                                  hintText: 'Username',
                                  // errorText: 'This username is unavailable. Please try another.',
                                  contentPadding:
                                      EdgeInsets.only(top: 10.h, left: 10.w),
                                  prefixIcon: Icon(
                                    Icons.alternate_email_outlined,
                                    color: _isvalid ? Colors.green : Colors.red,
                                  ),
                                  // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                                  focusColor: uColor,
                                  // focusColor: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ), //chooseusername
                          SizedBox(
                            height: 16.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 200.w,
                              child: ExpansionPanelList(
                                elevation: 0,
                                animationDuration:
                                    const Duration(milliseconds: 10),
                                children: [
                                  ExpansionPanel(
                                    headerBuilder: (context, isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          'Suggestions',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                        ),
                                      );
                                    },
                                    body: ListTile(
                                      title: Text(
                                        'Username',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ),
                                    isExpanded: _expanded,
                                    canTapOnHeader: true,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ],
                                dividerColor: Colors.grey,
                                expansionCallback: (panelIndex, isExpanded) {
                                  _expanded = !_expanded;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 50.h,
                          ),
                          SizedBox(
                            height: 54.h,
                            width: 400.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (_chooseusername.text.isValidUname)
                                      return bcolor1;
                                    return uColor;
                                  }),

                                  // elevation: ,
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                  ))),
                              onPressed: () async {
                                // signUp();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OtpEmail()));
                              },
                              child: Text(
                                'Create Account',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3!
                                    .copyWith(fontSize: 17.sp),
                                // TextStyle(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w500,
                                //     fontFamily: 'Nunito',
                                //     fontSize: 17.sp
                                //
                                // ),
                              ),
                            ),
                          ), //button
                          SizedBox(
                            height: 22.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(text: '', children: [
                                  TextSpan(
                                    text:
                                        'By creating an account you agree with our',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
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
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //page 3
        ],
      ),
    );
  }

  Future<void> signUp() async {
    if (_chooseusername.text.isValidUname &&
        formKeyy.currentState!.validate()) {
      final response =
          await http.post(Uri.https('beeperchat.herokuapp.com', '/user'),
              body: ({
                "username": _chooseusername.text.toString(),
                "email": _emailTextController.text.toString(),
                "password": _passwordTextController.text.toString(),
                "firstname": _fnameTextController.text.toString(),
                "lastname": lnameTextController.text.toString(),
                "phone": "+234${_phoneTextController.text.toString()}",
                "dob": _birthdateControlller.text,
                "gender": gender.toString(),
              }));
      if (response.statusCode == 201) {
        if (!mounted) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OtpEmail()));
        print('object');
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        // return LogIn.fromJson(jsonDecode(response.body));
      } else {
        if (!mounted) return;
        print(
            '${_fnameTextController.text}, ${lnameTextController.text}, ${_passwordTextController.text}, ${_chooseusername.text}, $gender');
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content:  Text('incomplete Registration',  style:Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: Colors.white)),
        //     backgroundColor: bcolor,
        //     behavior: SnackBarBehavior.floating,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(6.r),
        //     ),
        //     margin: EdgeInsets.only(
        //         bottom: MediaQuery.of(context).size.height - 150.h,
        //         right: 20.w,
        //         left: 20.w),
        //   ),
        // );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OtpEmail()));
      }
    }
  }
}
