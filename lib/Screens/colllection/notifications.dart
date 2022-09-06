import 'package:flutter/material.dart'; import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static const String id = 'Notifications';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(428.w,68.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Color(0xff8E8E8E),
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
              child: Text('Notifications', style: Theme.of(context).primaryTextTheme.bodyText1,),
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
    );
  }
}
