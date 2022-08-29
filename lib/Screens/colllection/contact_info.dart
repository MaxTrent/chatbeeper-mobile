import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  String username = 'JaneDoe';
  String phoneNumber = '+23483838383';
  String email = 'janedoe@mail.com';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40.h,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkModeOn == true ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 135.0.w),
          child: Text(
            'Settings',
            style: Theme.of(context)
                .primaryTextTheme
                .headline4!
                .copyWith(fontSize: 16.sp),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 2.h,
          ),
          ListTile(
            dense: true,
            title: Text(
              'Contact Information',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 16.sp),
            ),
          ),
          Divider(
            thickness: 2.h,
          ),
          ListTile(
            dense: true,
            leading: Text(
              'Username',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 14.sp),
            ),
            trailing: Text(
              '@$username',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 14.sp, color: Color(0xff386FA4)),
            ),
          ),
          ListTile(
            dense: true,
            leading: Text(
              'Phone',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 14.sp),
            ),
            trailing: Text(
              phoneNumber,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 14.sp, color: Color(0xff386FA4)),
            ),
          ),
          ListTile(
            dense: true,
            leading: Text(
              'Email Address',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 14.sp),
            ),
            trailing: Text(
              email,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 14.sp, color: Color(0xff386FA4)),
            ),
          )
        ],
      ),
    );
  }
}