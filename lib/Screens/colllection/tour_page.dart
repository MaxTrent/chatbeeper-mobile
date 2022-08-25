import 'dart:developer';

import 'package:chat_beeper/Screens/colllection/home_page.dart';
import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/tour_post.dart';
import 'package:chat_beeper/constants.dart';
import 'package:chat_beeper/Screens/colllection/timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);
  static const String id = 'Tour-page';

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(428.w,68.h),
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 18.w, top: 32.h),
            child: AppBar(
              // automaticallyImplyLeading: true,
              title: Text('Tour', style: Theme.of(context).primaryTextTheme.bodyText1,),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              // leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
              //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Timeline()
              //   ));
              // },)),
              actions: [
                IconTheme(data: Theme.of(context).iconTheme,
                    child: Icon(Icons.search, size: 24.h,)),
                SizedBox(width: 24.w,),
                IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: Icon(Icons.mail_outline,  size: 24.h,))
              ],
            ),
          ),
        ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index){
          return Column(
           children: [
             TourCard(),
           ],
          );
        },
      ),
    );
  }
}
