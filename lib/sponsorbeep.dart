import 'package:chat_beeper/proceedpayment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class SponsorBpage extends StatefulWidget {
  const SponsorBpage({Key? key}) : super(key: key);

  @override
  State<SponsorBpage> createState() => _SponsorBpageState();
}

class _SponsorBpageState extends State<SponsorBpage> {
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
            Align(
                alignment: Alignment.topLeft,
                child: Text('Select duration:', style: TextStyle(color: darkModeOn ? Colors.white:Colors.black, fontWeight: FontWeight.w700, fontSize: 18.sp),)),
            SizedBox(height: 16.h,),
            Row(
              children: [
                SizedBox(
                  width: 136.w, height: 32.h,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          shape:  MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: const BorderSide(
                                    color: Colors.transparent),
                              )),
                          backgroundColor: MaterialStateColor.resolveWith((states) => bcolor1)),
                      onPressed: null, child: Text('Days',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Nunito', fontSize: 13.sp,
                        fontWeight: FontWeight.w700
                    ),
                  )),
                ),
              ],
            ),//days
            SizedBox(height: 20.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));

                                });
                              }, child: Text('1 day',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('2 days',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));

                                });
                              }, child: Text('3 days',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));

                                });
                              }, child: Text('4 days',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('5 days',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('6 days',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('7 days',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 44.h,),
            Row(
              children: [
                SizedBox(
                  width: 136.w, height: 32.h,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          shape:  MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: const BorderSide(
                                    color: Colors.transparent),
                              )),
                          backgroundColor: MaterialStateColor.resolveWith((states) => bcolor1)),
                      onPressed: null, child: Text('Months',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Nunito', fontSize: 13.sp,
                        fontWeight: FontWeight.w700
                    ),
                  )),
                ),
              ],
            ),//months
            SizedBox(height: 20.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('1 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('2 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('3 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('4 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('5 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('6 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('7 months',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 44.h,),
            Row(
              children: [
                SizedBox(
                  width: 136.w, height: 32.h,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          shape:  MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: const BorderSide(
                                    color: Colors.transparent),
                              )),
                          backgroundColor: MaterialStateColor.resolveWith((states) => bcolor1)),
                      onPressed: null,
                      child: Text('Years',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Nunito', fontSize: 13.sp,
                        fontWeight: FontWeight.w700
                    ),
                  )),
                ),
              ],
            ),//years
            SizedBox(height: 20.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 308.w, height: 32.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('1 year',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('2 years',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 95.w, height: 32.h,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                              onPressed: ()async{
                                setState((){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) =>  const ProceedSponsored()));
                                });
                              }, child: Text('3 years',
                            style: TextStyle(
                                color: darkModeOn? Colors.white:Colors.black, fontFamily: 'Nunito', fontSize: 13.sp,
                                fontWeight: FontWeight.w700
                            ),
                          )),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
