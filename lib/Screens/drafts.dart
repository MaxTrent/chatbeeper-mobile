import 'package:chat_beeper/Widgets/draft_card.dart';
import 'package:chat_beeper/Widgets/follow_request_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class Drafts extends StatelessWidget {
   const Drafts({Key? key}) : super(key: key);

  final String fullName = 'Jane Doe';
  final String username = 'Janedoe_10';
  final String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

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
      appBar:  PreferredSize(
        preferredSize: Size(428.w,68.h),
        child: Container(
          decoration:  const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: uColor,
                      style: BorderStyle.solid
                  )
              )
          ),
          child: AppBar(
            automaticallyImplyLeading: true,
            leading: Padding(
              padding:  EdgeInsets.only(top: 29.h),
              child:    SizedBox(
                height: 32.h,
                child:  GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  // child: CircleAvatar(
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100.0.r),
                  //     child: Image.asset('images/pp_round.png'),
                  //   ),
                  // ),
                  child: Icon(Icons.arrow_back_ios, color: darkModeOn? Colors.white:Colors.black,),
                ),
              ),
            ),
            title: Padding(
              padding:  EdgeInsets.only(top: 32.h),
              child: Text('Drafts', style: Theme.of(context).primaryTextTheme.bodyText1,),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.5,
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index)=> const Draftcard(),
      itemCount: 10,
      ),
    );
  }
}
