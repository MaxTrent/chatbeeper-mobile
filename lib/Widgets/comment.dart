import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';
class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(428.w,68.h),
        child: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 18.w, top: 32.h),
          child: PreferredSize(
            preferredSize: Size(width, 77.h),
            child: AppBar(
              automaticallyImplyLeading: true,
              title: Text('Comments', style: Theme.of(context).primaryTextTheme.bodyText1,),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
                Navigator.of(context).pop();
              },)),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 1.h,
            color: bcolor1,
          ),
          PostBeep(),//divider
        ],
      ),
    );
  }
}
