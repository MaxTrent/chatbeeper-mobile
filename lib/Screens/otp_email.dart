import 'dart:async';

import 'package:chat_beeper/Screens/otp_failed.dart';
import 'package:chat_beeper/Screens/sign_in.dart';
import 'package:chat_beeper/model/OtpModel_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../constants.dart';
import 'otp_passed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_beeper/model/OtpModel_email.dart';


class OtpEmail extends StatefulWidget {
  const OtpEmail({Key? key}) : super(key: key);
  static const String id = 'otpemail-screen';

  @override
  State<OtpEmail> createState() => _OtpEmailState();
}

class _OtpEmailState extends State<OtpEmail> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  bool _otpcorrect = false;
  bool _otpfull = false;

  final _formKey = GlobalKey<FormState>();
  final otpcontroller = TextEditingController();
  final focusNode = FocusNode();
  final int _value = 1;
  var email = 'email@emai3l.com';
  var username = 'usernameplw';
  late final String token;

  // Future<VerifyEmail> verify(String username, String email, String token) async{
  //   if(formKey.currentState!.validate() &&otpcontroller.text.isNotEmpty){
  //     final response = await http.post(Uri.https('beeperchat.herokuapp.com', 'auth/verify-token/email'),
  //         body: ({
  //           "username": username,
  //           "email": email,
  //           "token": token,
  //         }));
  //     if (response.statusCode == 201) {
  //       if (!mounted) {
  //         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SignIn()
  //         ));
  //       }
  //       // If the server did return a 201 CREATED response,
  //       // then parse the JSON.
  //       return VerifyEmail.fromJson(jsonDecode(response.body));
  //     }
  //       if (response.statusCode == 400){
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content:  Text('User has already verified email',  style:Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: Colors.white)),
  //             backgroundColor: bcolor,
  //             behavior: SnackBarBehavior.floating,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(6.r),
  //             ),
  //             margin: EdgeInsets.only(
  //                 bottom: MediaQuery.of(context).size.height - 150.h,
  //                 right: 20.w,
  //                 left: 20.w),
  //           ),
  //         );
  //       }
  //       // if (!mounted) {
  //       //   ScaffoldMessenger.of(context).showSnackBar(
  //       //     SnackBar(
  //       //       content:  Text('Incorrect details',  style:Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: Colors.white)),
  //       //       backgroundColor: bcolor,
  //       //       behavior: SnackBarBehavior.floating,
  //       //       shape: RoundedRectangleBorder(
  //       //         borderRadius: BorderRadius.circular(6.r),
  //       //       ),
  //       //       margin: EdgeInsets.only(
  //       //           bottom: MediaQuery.of(context).size.height - 150.h,
  //       //           right: 20.w,
  //       //           left: 20.w),
  //       //     ),
  //       //   );
  //       // }
  //   }else {
  //     throw Exception('Failed');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return Scaffold(
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 60.h),
              child: Image.asset('images/verify.png', height: 137.h, width: 150.w,),
            ),
            Padding(
              padding:  EdgeInsets.all(17.0),
              child: Column(
                children: [
                   SizedBox(width:5.w, height: 0.01.h),
                  Text(
                      'Authentication',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.subtitle2
                    // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                  ),//Authenticate
                   SizedBox(width:5.w, height: 0.03.h),
                  Center(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                              'Please enter the 6 digit Authentication code sent to $email',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).primaryTextTheme.bodyText1
                            // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),//AND WRITE UP, whois creating
                  Padding(
                    padding:  EdgeInsets.only(top: 36.h, bottom: 30.h),
                    child: Form(
                      key: formKey,
                      child: OtpTextField(
                        cursorColor:  Theme.of(context).colorScheme.secondaryVariant,
                        textStyle:  Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 25.sp),
                        hasCustomInputDecoration: false,
                        showFieldAsBox: false,
                        numberOfFields: 6,
                        borderColor: Colors.grey,
                        focusedBorderColor: Colors.grey,
                        disabledBorderColor: Colors.grey,
                        autoFocus: true,
                          clearText: true,
                          enabledBorderColor: Colors.grey,
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String pin){
                          setState(() {
                            token == pin;
                            print(pin);
                          });
                      }, // end onSubmit
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54.h,
                    width: 400.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states){
                                if (_otpfull == true ) return  bcolor1;
                                return uColor;
                              }
                          ),
                          // elevation: ,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side: const BorderSide(color: Colors.transparent),
                              )
                          )
                      ),
                      onPressed: () async {
                        // verify();
                      },
                      child:  Text('Verify',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline3,
                        // TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w500,
                        //     fontFamily: 'Nunito',
                        //     fontSize: 16.sp
                        //
                        // ),
                      ),),
                  ),//button
                  SizedBox(height: 60.h,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: '',
                            children: [
                              TextSpan(text: 'Resend code after 60 Seconds',style:Theme.of(context).primaryTextTheme.bodyText1 ),
                            ]
                        ),

                      ),
                      SizedBox(height: 8.h,),
                      RichText(
                        text: TextSpan(
                            text: '',
                            children: [
                              TextSpan(
                                text: 'Resend Code',style:  TextStyle(color: Colors.grey, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 18.sp, fontFamily: 'Nunito'),
                                recognizer: TapGestureRecognizer()..onTap=()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpEmail(),
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
      ),
    );
  }

}
