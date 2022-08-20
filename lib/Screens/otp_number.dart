import 'dart:async';

import 'package:chat_beeper/Screens/otp_passed.dart';
import 'package:chat_beeper/Screens/sign_Up_personal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'otp_passed.dart';
import '../constants.dart';
import 'package:chat_beeper/Screens/otp_failed.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpAuth extends StatefulWidget {
  const OtpAuth({Key? key}) : super(key: key);
  static const String id = 'confirm-screen';

  @override
  State<OtpAuth> createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  // StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   errorController = StreamController<ErrorAnimationType>();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   errorController!.close();
  //
  //   super.dispose();
  // }

  final _formKey = GlobalKey<FormState>();
  final otpcontroller = TextEditingController();
  final focusNode = FocusNode();
  final int _value = 1;
  var email = 'JandeDoe@gmail,com';
  @override
  void dispose() {
    otpcontroller.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 60.h),
            child: Image.asset('images/verify.png', height: 137.h, width: 150.w,),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                 SizedBox(width:5.w, height: 32.h),
                Text(
                  'Verification',
                  textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(fontSize: 25.sp, color: Colors.black)
                  // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                ),//Authenticate
                 SizedBox(width:5.w, height: 0.03.h),
                Center(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'Please enter the 6 digit verification code sent to $email',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).primaryTextTheme.headline5!.copyWith(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w400)
                        ),
                      ),
                    ),
                  ),
                ),//AND WRITE UP, whois creating
                Padding(
                  padding:  EdgeInsets.only(top: 36.h, bottom: 34.h),
                  child: SizedBox( width: 272.w,height: 50.h,
                    child: OtpTextField(
                      textStyle: TextStyle(
                          color: Colors.white,
                        fontSize: 25.sp
                      ),
                      numberOfFields: 4,
                      showCursor: false,
                      autoFocus: true,
                      focusedBorderColor: bcolor3,
                      borderColor: bcolor3,
                      borderWidth: 1,
                      fieldWidth: 50.w,
                      cursorColor:Colors.white,
                      fillColor: bcolor3,
                      filled: true,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (pin) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (pin){
                        if (pin == '2224'){
                          Navigator.pushReplacementNamed(context, OtpPassed.id);
                        }
                        else {
                          Navigator.pushReplacementNamed(context, OtpFailed.id);
                        }
                        return null;

                        // showDialog(
                        //     context: context,
                        //     builder: (context){
                        //       return AlertDialog(
                        //         title: Text("Verification Code"),
                        //         content: Text('Code entered is $verificationCode'),
                        //       );
                        //     }
                        // );
                      }, // end onSubmit
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '',
                          children: [
                             TextSpan(text: 'Didn\'t get an OTP? ',style: TextStyle( color:Colors.grey.shade700, fontFamily: 'Nunito', fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 18.sp),),
                            TextSpan(
                              text: 'Resend',style:  TextStyle(color: bcolor3, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 18.sp, fontFamily: 'Nunito'),
                              recognizer: TapGestureRecognizer()..onTap=()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpPassed(),
                              ),),
                            ),
                          ]
                      ),

                    ),
                  ],
                ),

              ],
            ),
          ),//TopOW
        ],
      ),
    );
  }
}
