import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'authenticate_signup.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String id = 'reset-screen';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
 final _mobilenumberController = TextEditingController();
 late bool  _validated = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int textLength = 0;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                SizedBox(height: 60.h,),
                Center(
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/logo1.png',),
                          fit: BoxFit.contain
                      ),),
                  ),
                ),//image
                SizedBox(height: 28.h,),
                Center(
                    child: Text('Forgot Your Password?',style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(fontWeight: FontWeight.w700, fontSize: 22.sp), textAlign: TextAlign.center,
                    )
                ),//forgot password
                SizedBox(height: 31.h,),
                Center(
                    child: Text('Enter your registered phone number \n to receive an OTP.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline5!.copyWith(color: Colors.grey.shade700,fontWeight: FontWeight.w400, fontSize: 18.sp),
                    )
                ),//enter
                SizedBox(height: 131.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 17.w, right: 17.w),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {

                        return 'Please type a username';
                      }
                      if (value.length <= 6 || value.length>=10) {

                        return 'This number is incorrect';
                      }
                      if (value == 'JaneDoe'|| value== 'BeeperChat') {

                        return 'This username is unavailable. Please try another.';
                      }
                      if ( value.length>11) {

                        return 'The number is too long. Please try another.';
                      }
                      return null;
                    },
                    onChanged: (text){
                      setState((){
                        textLength = text.length;
                        // _validated = text ?? false;
                      });
                    },
                    style:  TextStyle(
                        color: bcolor3,
                        fontFamily: 'Nunito',
                        fontSize: 20.sp
                    ),
                    controller: _mobilenumberController,
                    decoration:   InputDecoration(
                      // errorText: 'The Username You entered is Unavailable.pls Try again' ,
                      errorStyle:  TextStyle(
                        fontFamily: "UBUNTU",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),

                      // suffixIcon: _isValidate == true ? Icon(Icons.check_sharp) : _isValidate == false ? const Icon(Icons.error): null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: const BorderSide(width: 0.0),
                      ),
                      errorBorder:   OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w,
                            color: bcolor3),
                      ),
                      focusedErrorBorder:   OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w,
                            color: bcolor3),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide:BorderSide(
                            width: 2.w,
                            color: bcolor3),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w,
                            color: bcolor3),
                      ),


                      hintText: ' Mobile Number',
                      labelStyle:  Theme.of(context).primaryTextTheme.headline1!.copyWith(color: bcolor3),

                      contentPadding:   EdgeInsets.only(left:20.w ),
                      hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 20.sp),
                      focusColor: bcolor,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),//textformfield
                SizedBox(height: 97.h,),//space inbetween
                Text(
              'Didn\'t recieve a code?' ,
              style:
            TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, fontSize: 18.sp, fontFamily: 'Nunito'),
            ),//didnt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '',
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap=()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPassword(),
                              ),),
                              text: 'Resend OTP',style: TextStyle( color:bcolor3, fontFamily: 'Nunito', fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 18.sp),),
                          ]
                      ),

                    ),
                  ],
                ),//resend otp
                SizedBox(height: 41.h,),
                SizedBox(
                  height: 54.h,
                  width: 249.w,
                  child:  Opacity(

                    opacity: 0.6,
                    child: ElevatedButton(
                      style:
                      ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45.53.r),
                              side: const BorderSide(color: Colors.transparent),
                            )
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return bcolor3;
                            return bcolor3; // Use the component's default.
                          },
                        ),
                      ),
                      //    backgroundColor: MaterialStateProperty.all(const Color(
                      //                         0xff295b85)),

                      onPressed: () {
                        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  AuthenticateSignup(),
                        // )
                        // );
                      },
                      child:  Text('Send OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            fontSize: 20.sp

                        ),
                      ),
                    ),
                  ),
                ),//button Row
              ],
            ),
          ),
        ),
      ),
    );
  }
}
