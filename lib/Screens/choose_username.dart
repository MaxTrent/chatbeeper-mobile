import 'package:chat_beeper/Screens/authenticate_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChooseUsername extends StatefulWidget {
  const ChooseUsername({Key? key}) : super(key: key);
  static const String id = 'Choose-username';

  @override
  State<ChooseUsername> createState() => _ChooseUsernameState();
}

class _ChooseUsernameState extends State<ChooseUsername> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  late bool  _validated = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int textLength = 0;
    return Scaffold(
      body:Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 60.h,),
              Center(child: Text('Choose a Username',style: Theme.of(context).primaryTextTheme.subtitle2, textAlign: TextAlign.center,)),
              SizedBox(height: 28.h,),
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
              SizedBox(height: 37.h,),
              Center(
                child: Container(
                  height: 200.h,
                  width: 276.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/chooseusername.png',),
                        fit: BoxFit.contain
                    ),),
                ),
              ),//image
              SizedBox(height: 28.31.h,),
              Padding(
                padding:  EdgeInsets.only(left: 17.w, right: 17.w),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {

                      return 'Please type a username';
                    }
                    if (value.length <= 6 || value.length>=10) {

                      return 'This Username is unavailable. Please try another';
                    }
                    if (value == 'JaneDoe'|| value== 'BeeperChat') {

                      return 'This username is unavailable. Please try another.';
                    }
                    if ( value.length>=11) {

                      return 'The username is too long. Please try another.';
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
                  controller: _usernameTextController,
                  decoration:   InputDecoration(
                    // errorText: 'The Username You entered is Unavailable.pls Try again' ,
                    errorStyle:  TextStyle(
                      fontFamily: "UBUNTU",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    suffixIcon: Icon
                      (textLength > 5 ? Icons.check : Icons.error_outline_outlined, color: textLength < 5 ? Colors.red.shade800 : Colors.green,
                    size: 32.h,
                    ),
                    // suffixIcon: _isValidate == true ? Icon(Icons.check_sharp) : _isValidate == false ? const Icon(Icons.error): null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: const BorderSide(width: 0.0),
                    ),
                    errorBorder:   OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                          width: 0.5.w,
                          color: bcolor3),
                    ),
                    focusedErrorBorder:   OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                          width: 1.5.w,
                          color: bcolor3),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide:BorderSide(
                          width: 1.5.w,
                          color: bcolor3),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                          width: 1.5.w,
                          color: bcolor3),
                    ),


                    hintText: ' @JohnDoe',
                    labelStyle:  Theme.of(context).primaryTextTheme.headline1!.copyWith(color: bcolor3),

                    contentPadding:   EdgeInsets.only(left:20.w ),
                    hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 20.sp),
                    focusColor: bcolor,
                    // focusColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 102.h,),//space inbetween
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
                              borderRadius: BorderRadius.circular(45.52.r),
                              side: const BorderSide(color: Colors.transparent),
                            )
                        ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return bcolor3;
                          }
                          return bcolor3; // Use the component's default.
                        },
                      ),
                    ),
                    //    backgroundColor: MaterialStateProperty.all(const Color(
                    //                         0xff295b85)),

                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  AuthenticateSignup(),
                      )
                      );
                    },
                    child:  Text('Continue',
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
    );
  }
}
