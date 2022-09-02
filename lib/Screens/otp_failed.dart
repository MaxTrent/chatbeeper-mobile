import 'package:chat_beeper/Screens/authenticate_signup.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart'; import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFailed extends StatelessWidget {
  const OtpFailed({Key? key}) : super(key: key);
  static const String id = 'otpfail-screen';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width,50.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(
            color: bcolor3, //change your color here
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 70.h,
                width: 70.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/logo1.png',),
                      fit: BoxFit.contain
                  ),),
              ),),
            Padding(
              padding:  EdgeInsets.only(top: 24.h, bottom: 7.h),
              child: Center(child: Text('Authentication Failed',style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(fontSize: 22.sp), textAlign: TextAlign.center,)),
            ),
            Center(
              child: Center(
                child: Text(
                    'Your account could not be authenticated',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.headline5!.copyWith(color: Colors.grey.shade700,fontSize: 18.sp)
                  // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                ),
              ),
            ),
            SizedBox(height: 28.h,),
            Padding(
              padding:  EdgeInsets.only(bottom: 66.h),
              child: Center(
                child: Container(
                  height: 283.h,
                  width: 294.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/authfailed.png',),
                        fit: BoxFit.contain
                    ),),
                ),
              ),
            ),//image
            SizedBox(
              height: 54.h,
              width: 249.w,
              child: Opacity(
                opacity: 0.6,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(
                          0xff295b85)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.52.r),
                            side: const BorderSide(color: Colors.transparent),
                          )
                      )
                  ),
                  onPressed: () => null,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Started',
                          textAlign: TextAlign.center,
                          style:Theme.of(context).primaryTextTheme.headline3!.copyWith(fontSize: 20.sp)),
                    ],
                  ),),
              ),
            ),//get started


          ],
        ),
      ),
    );
  }
}
