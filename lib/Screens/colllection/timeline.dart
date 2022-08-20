import 'package:chat_beeper/Screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/Post.dart';
import '../../constants.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);
  static const String id = 'Timeline';

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), topLeft:Radius.circular(10.r),topRight: Radius.circular(10.r), )
          ),
          foregroundColor: bcolor1,
          backgroundColor: bcolor1,
          child: IconButton(icon: Icon(CupertinoIcons.pen), onPressed: () {
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const PostCard()));
          }, color: Colors.white,),
          onPressed: (){}),
      appBar: PreferredSize(
        preferredSize: Size(width,70),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Image.asset('images/logo1.png',height: 50.h , width: 50.h,),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 2,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Container(

                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.r))
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, Profile.id);
                    },
                      child: Image.asset('images/Pp.png',height: 50, width: 50,)),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(

    itemCount: 10,
    itemBuilder: (BuildContext context, index){
      return Card(
        child: Wrap(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), ),
                  ),
                  height: 50.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/Pp.png', height: 50.h, width: 50.w,),
                      Text('Mark Peter'),
                      Text('@markpetr', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: uColor, fontSize: 15.sp),),
                    ],
                  ),
                ),
                //mark caption
                Padding(
                  padding:  EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Wrap(
                    children: [
                      SizedBox(
                        height:80.h,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text('10 minutes ago',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    ),
    );
  }
}
