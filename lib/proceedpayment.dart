import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:chat_beeper/paymentcheckout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class ProceedSponsored extends StatefulWidget {
  const ProceedSponsored({Key? key}) : super(key: key);

  @override
  State<ProceedSponsored> createState() => _ProceedSponsoredState();
}

class _ProceedSponsoredState extends State<ProceedSponsored> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration:  const BoxDecoration(
              border: Border(
                  bottom:
                  BorderSide(color: uColor, style: BorderStyle.solid))),
          child: SafeArea(
            child: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_new, color: darkModeOn? Colors.white: Colors.black,)),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 20.h,right: 70.w),
                child: SizedBox(
                    height: 34.h,
                    // width: 159.w,
                    child: SvgPicture.asset(
                      'images/chatbeeper_blue.svg',
                    )),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 28.w, right: 28.w),
        child: Column(
          children: [
            SizedBox(height: 23.h,),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Sponsor this beep', style: TextStyle(color: darkModeOn ? Colors.white:Colors.black, fontWeight: FontWeight.w700, fontSize: 18.sp),)),
            SizedBox(height: 65.h,),
            PostBeep(),
            SizedBox(height: 179.h,),
            SizedBox(
              height: 54.h,
              width: 400.w,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSponsored(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to payment',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline3!
                          .copyWith(fontSize: 21.sp),
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
            ),
          ],
        ),
      ),
    );
  }
}
