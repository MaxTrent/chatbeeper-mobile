import 'package:chat_beeper/Widgets/follow_request_card.dart';
import 'package:chat_beeper/Widgets/room_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
class FollowerRequests extends StatefulWidget {
  const FollowerRequests({Key? key}) : super(key: key);

  @override
  State<FollowerRequests> createState() => _FollowerRequestsState();
}

class _FollowerRequestsState extends State<FollowerRequests> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      appBar: PreferredSize(
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
              padding:  EdgeInsets.only(top: 25.h),
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
              padding:  EdgeInsets.only(top: 32.h),
              child: Text('Requests', style: Theme.of(context).primaryTextTheme.bodyText1,),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.5,
            // leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
            //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Timeline()
            //   ));
            // },)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 712.h,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children:  const [
                  FollowRequestCard(),
                 // FollowerRequests(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
