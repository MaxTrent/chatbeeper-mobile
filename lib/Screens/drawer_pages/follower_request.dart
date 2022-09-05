import 'package:chat_beeper/Widgets/follow_request_card.dart';
import 'package:chat_beeper/Widgets/room_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 18.w, top: 32.h),
          child: AppBar(
            // automaticallyImplyLeading: true,
            title: Text('Requests', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 16.sp),),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
             Navigator.pop(context);
            },)),
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
                children:  [
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
