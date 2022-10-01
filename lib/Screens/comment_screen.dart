import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';

import '../Widgets/post_comment.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 74.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: uColor,
          ))),
          child: AppBar(
            toolbarHeight: 74.h,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(top: 29.h),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: darkModeOn == true ? Colors.white : Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Text('Comments',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 22.sp)),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            Column(children: [PostBeep(), PostComment()]),
        itemCount: 5,
      ),
    );
  }
}
