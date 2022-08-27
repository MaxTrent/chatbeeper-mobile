import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Settings',
            style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                  fontSize: 20.sp,
                )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: ListTile(
                leading: Icon(Icons.av_timer_sharp),
                title: Text(
                  'Personal Information',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(fontSize: 18.sp),
                ),
                onTap: null,
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Contact Information',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 17.h,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        'Identity Confirmation',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 17.h,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        'Deactivate account',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 17.h,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        'Security',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(fontSize: 18.sp),
                      ),
                      onTap: () {},
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
