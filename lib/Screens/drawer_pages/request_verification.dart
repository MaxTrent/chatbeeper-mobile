import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';

class RequestVerification extends StatelessWidget {
  const RequestVerification({Key? key}) : super(key: key);
  final String verifyDisclaimer =
      'Chatbeeper verification gives your presence credibility and generates trust. To protect our community from impersonators, we require a solid proof that you are exactly who you say you are and that you and/or your business is legitimate, therefore if you wish to request the blue badge, these criteria must be met. ';
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const Text('Verification'),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: bcolor3,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r),bottomRight:Radius.circular(30.r),topRight: Radius.circular(-10.r) ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20.w,),
                          Padding(
                            padding:  EdgeInsets.only(left: 16.w, right: 130.w,  top: 10),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Image.asset('images/back.png', height: 30.h, width: 40.w,)),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 5.h,top: 15.h),
                            child: Image.asset('images/logo1.png', height: 45.h,),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 160.w,top: 5.h,),
                        child: Row(
                          children: [
                            Text('Verification',

                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),//background
              // Positioned(
              //   top: 30.h,
              //   left: 0.w,
              //   right: 450.w,
              //   bottom: 50.h,
              //   child: GestureDetector(
              //     onTap: (){
              //       Navigator.of(context).pop();
              //     },
              //     child:Image.asset('images/back.png', height: 40,),
              //   ),
              // ),//backbutton
              // // Positioned(
              // //   top: 20.h,
              // //   left: 0.w,
              // //   right: 50.w,
              // //   bottom: 50.h,
              // //   child: Transform.scale(
              // //       scale: 0.23,
              // //       child: Image.asset('images/logo1.png', )),),
              // Positioned(
              //   top: 120.h,
              //   left: 130.w,
              //   right: 50.w,
              //   bottom: 0.h,
              //   child: Text('Verification',
              //   style: TextStyle(
              //     fontSize: 24.sp,
              //     color: Colors.white,
              //     fontWeight: FontWeight.w600
              //   ),
              //   ),),

            ],
          ),
          Column(
            children: [
              SizedBox(height: 15.h,),
              Center(
                child: Text('Here’s what you need to know',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: bcolor1,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              Padding(
                padding:  EdgeInsets.only(left: 17.w,bottom: 40.h, right: 17.w),
                child: Text(verifyDisclaimer,
                  style:
                  TextStyle(
                      fontSize: 17.sp,
                      color: darkModeOn? Colors.white: Colors.black,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:  EdgeInsets.only(left: 21.w,bottom: 102.h,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('A verified phone number', style: TextStyle(color: darkModeOn? Colors.white:Colors.black),),
                  SizedBox(height: 16.h,),
                  Text('A confirmed email address'),
                  SizedBox(height: 16.h,),
                  Text('A bio'),
                  SizedBox(height: 16.h,),
                  Text('A profile photo'),
                  SizedBox(height: 16.h,),
                  Text('A header photo'),
                  SizedBox(height: 16.h,),
                  Text('A website'),
                  SizedBox(height: 16.h,),
                  Text('A birthday'),


                ],
              ),
            ),
          ),
          SizedBox(
            height: 54.h,
            width: 372.w,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(const Color(0xff295b85)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        side: const BorderSide(color: Colors.transparent),
                      ))),
              onPressed: () {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apply now',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500
                    ),
                    // TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w500,
                    //     fontFamily: 'Nunito',
                    //     fontSize: 17.sp
                    //
                    // ),
                  ),
                ],
              ),
            ),
          ),//button
        ],
      ),
    );
  }
}
