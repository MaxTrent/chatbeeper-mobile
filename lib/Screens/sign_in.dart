import 'package:chat_beeper/Screens/colllection/home_page.dart';
import 'package:chat_beeper/Screens/confirm_Screen.dart';
import 'package:chat_beeper/Screens/password_recovery.dart';
import 'package:chat_beeper/Screens/sign_Up_personal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Signin_model.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signIn-screen';

  const SignIn({Key? key}) : super(key: key);
  // const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  // Icon? icon;
  // bool _visible = false;
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  Icon? icon;
  bool _visible = false;
  String? user = 'b@gmail.com';
  String? email;
  String? vUser;
  String? password;
  // String? apassword = '123456';
  // String? vPassword;
  // bool _loading = false;
  FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                  height: 40.h,
                  width: 40.w,
                )),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 32.sp),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  width: 372.w,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 372.w,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .copyWith(fontSize: 15.sp),
                          controller: _userTextController,
                          // validator: (val) {
                          //   if (!val!.isValidEmail || val.isEmpty) {
                          //     return 'Enter valid email';
                          //   }
                          // //   if(val.isValidEmail ){
                          // //     val = vUser;
                          // //   }
                          //   return null;
                          // },
                          // onFieldSubmitted:(value){
                          //   value = _userTextController.text.toString();
                          // },
                          //
                          // onSaved: (value){
                          //   value = vUser;
                          // },
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
                              borderSide:
                                  BorderSide(width: 0.5.w, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(width: 0.5.w, color: Colors.red),
                            ),
                            errorStyle: TextStyle(height: 0, fontSize: 10.sp),
                            labelText: 'Username',
                            hintText: 'username',
                            labelStyle:
                                Theme.of(context).primaryTextTheme.bodyText1,
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
                      ), //email log in
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 372.w,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          // validator: (val) {
                          //   if(val!.isEmpty || val.length < 6){
                          //     return'Password has to be atleast 6 characters long. try again';
                          //   }
                          //   if(val.isValidPassword ){
                          //   val = vPassword;
                          //   }
                          //   return null;
                          // },
                          // onFieldSubmitted: (val){
                          //   val = _passwordTextController.text.toString();
                          //   password == val;
                          // },
                          // onSaved: (val){
                          //   val = _passwordTextController.text.toString();
                          // },
                          obscureText: _visible == false ? true : false,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .copyWith(fontSize: 15.sp),
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
                              borderSide:
                                  BorderSide(width: 0.5.w, color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(width: 0.5.w, color: Colors.red),
                            ),
                            errorStyle: TextStyle(height: 0, fontSize: 10.sp),
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
                            labelStyle:
                                Theme.of(context).primaryTextTheme.bodyText1,
                            hintStyle:
                                Theme.of(context).primaryTextTheme.bodyText2,
                            contentPadding:
                                EdgeInsets.only(top: 10.h, left: 10.w),
                            // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                            focusColor: bcolor3,
                            // focusColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ), //password
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Forgot password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: bcolor4,
                                  fontSize: 18.sp,
                                  fontFamily: 'Nunito'),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword(),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ), //forgot password
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
                                if (_userTextController.text.isEmpty ||
                                    _passwordTextController.text.isEmpty) {
                                  return uColor;
                                }
                                return bcolor1;
                              }),

                              // elevation: ,
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side:
                                    const BorderSide(color: Colors.transparent),
                              ))),
                          onPressed: () {
                            // logIn();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                          child: Text(
                            'Log in',
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
      ),
    );
  }

  Future<void> logIn() async {
    if (_formKey.currentState!.validate() &&
        _userTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      final response =
          await http.post(Uri.https('beeperchat.herokuapp.com', 'auth/login'),
              body: ({
                "email": _userTextController.text.toString(),
                "password": _passwordTextController.text.toString(),
              }));
      if (response.statusCode == 201) {
        if (!mounted) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        // return LogIn.fromJson(jsonDecode(response.body));
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect details',
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
}
