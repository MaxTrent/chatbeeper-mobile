import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import '../../sponsorbeep.dart';

class Sponsored extends StatefulWidget {
  const Sponsored({Key? key}) : super(key: key);
  static const String id = 'signIn-screen';
  @override
  State<Sponsored> createState() => _SponsoredState();
}

class _SponsoredState extends State<Sponsored> {
  final _key = GlobalKey<ScaffoldState>();
  String span = "Chatbeeper sponsored beeps are one of the effective advertising options offered to individuals and business owners. By defining your brand, or defining your beep, you get the best engagement regardless of the content. Be it about food, beauty, health, fashion, etc. "
      "\n \n \n \n Sponsor your beeps to reach a vast array of users within our community and increase your brand awareness."

  ;
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
        padding:  EdgeInsets.only(left: 16.w, right: 16.w, top: 23.h, bottom: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(bottom: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You care about your brand, we do too!', style:  TextStyle(
                      fontSize: 17.sp,
                      color: darkModeOn?Colors.white:Colors.black,
                      fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: RichText(text: TextSpan(
                text: span, style: TextStyle(color: Colors.black)
              )),
            ),
            SizedBox(height: 32.h,),
            Align(
              alignment: Alignment.topLeft,
                child: Text('Select plan:', style: TextStyle(color: darkModeOn ? Colors.white:Colors.black, fontWeight: FontWeight.w700, fontSize: 18.sp),)),
            SizedBox(height: 10.h,),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 70.h, width: 201.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: uColor),
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 5.h, bottom: 5.h),
                            child: Text('Reach 1000 — 2000 users',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:  bcolor1, fontSize: 14.sp,fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          SizedBox(
                            width: 136.w, height: 32.h,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: bcolor1),
                                onPressed: ()async{
                                  setState((){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) =>  const SponsorBpage()));

                                    print('object');
                                  });
                                }, child: Text('500 Naira daily',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Nunito', fontSize: 13.sp,
                                  fontWeight: FontWeight.w700
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    Container(
                      height: 70.h, width: 201.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: uColor),
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 5.h, bottom: 5.h),
                            child: Text('Reach 2000 — 3500 users',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:  bcolor1, fontSize: 14.sp,fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          SizedBox(
                            width: 136.w, height: 32.h,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: bcolor1),
                                onPressed: ()async{
                                  setState((){
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) =>  const SponsorBpage()));
                                  });
                                }, child: Text('1000 Naira daily',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Nunito', fontSize: 13.sp,
                                  fontWeight: FontWeight.w700
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    Container(
                      height: 70.h, width: 201.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: uColor),
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 5.h, bottom: 5.h),
                            child: Text('Reach 3500 — 5000 users',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:  bcolor1, fontSize: 14.sp,fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                          SizedBox(
                            width: 136.w, height: 32.h,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: bcolor1),
                                onPressed: ()async{
                                  setState((){
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) =>  const SponsorBpage()));
                                  });
                                }, child: Text('2000 Naira daily',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Nunito', fontSize: 13.sp,
                                  fontWeight: FontWeight.w700
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
