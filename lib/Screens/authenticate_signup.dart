import 'package:chat_beeper/Screens/otp_email.dart';
import 'package:chat_beeper/Screens/otp_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'package:group_radio_button/group_radio_button.dart';

String _verticalGroupValue = "Phone Number";
String _singleValue = "none";

List<String> _status = ["Email", "Phone Number"];

class AuthenticateSignup extends StatefulWidget {
   const AuthenticateSignup({Key? key}) : super(key: key);
  static const String id = 'authenticate-signup';

  @override
  State<AuthenticateSignup> createState() => _AuthenticateSignupState();
}

class _AuthenticateSignupState extends State<AuthenticateSignup> {
  bool navigateToPage = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: 60.h),
                    child: Image.asset('images/logo1.png', height: 70.h, width: 70.w,),
                  ),
                ],
              ),
            ),//top
            SizedBox(height: height*0.05.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  'Authenticate Your Account',
                  style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(fontSize: 25.sp),
                  // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                ),
                SizedBox(width:5, height: height*0.02.h),
                 Center(
                  child: Text(
                    'Select your preferred authentication method',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.headline5!.copyWith(color: Colors.grey.shade700,fontWeight: FontWeight.w400, fontSize: 18.sp),
                    // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                  ),
                ),//AND WRITE UP

                  SizedBox(height: 18.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(left: 50.w),
                      child: SizedBox(
                        height: 90.h, width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height:30.h,
                              child: Theme(
                                data: ThemeData(
                                 unselectedWidgetColor: bcolor
                                ),
                                child: RadioButton(
                                  description: "Phone Number",
                                  value: "Phone Number",
                                  groupValue: _singleValue,
                                  onChanged: (value) {
                                    setState(() {
                                      navigateToPage = true;
                                      value: "Phone NUmber";
                                    });

                                    if (navigateToPage) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return OtpAuth();
                                          }));
                                    }
                                  },



                                  activeColor: bcolor,
                                  textStyle:  TextStyle(
                                    color: bcolor,
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:30.h,
                              child: Theme(
                                data:ThemeData(
                                    unselectedWidgetColor: bcolor
                                ),
                                child: RadioButton(
                                  description: "Email",
                                  value: "Email",
                                  groupValue: _singleValue,
                                  onChanged: (value) {
                                    setState(() {
                                      navigateToPage = true;
                                      value = 'Email';
                                    });

                                    if (navigateToPage) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return const OtpEmail();
                                          }));
                                    }
                                  },
                                  textPosition: RadioButtonTextPosition.right,
                                  textStyle:    TextStyle(
                                    color: bcolor,
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23.sp,
                                  ),
                                ),
                              ),//email
                            ),//business
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),

      ),
    );
  }
}
