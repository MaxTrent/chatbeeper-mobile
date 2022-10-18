import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);
  static const String id = 'country';

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    bool? _isChecked = false;

    String _currText = ' ';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 40.h,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkModeOn == true ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings',
            style: Theme.of(context)
                .primaryTextTheme
                .headline4!
                .copyWith(fontSize: 19.sp)),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 2.h,
          ),
          ListTile(
            dense: true,
            title: Text(
              'Country',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 19.sp),
            ),
          ),
          Divider(
            height: 16.h,
            thickness: 2.h,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                CheckboxListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset('images/twemoji_flag-nigeria.svg'),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Nigeria'),
                        ),
                      ],
                    ),
                    value: false,
                    onChanged: (_) {}),
                CheckboxListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset('images/twemoji_flag-spain.svg'),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Spain'),
                        ),
                      ],
                    ),
                    value: false,
                    onChanged: (_) {}),
                CheckboxListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset('images/twemoji_flag-portugal.svg'),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Portugal'),
                        ),
                      ],
                    ),
                    value: false,
                    onChanged: (_) {}),
                CheckboxListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset('images/twemoji_flag-kenya.svg'),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Kenya'),
                        ),
                      ],
                    ),
                    value: false,
                    onChanged: (_) {}),
                CheckboxListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset('images/twemoji_flag-germany.svg'),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Germany'),
                        ),
                      ],
                    ),
                    value: false,
                    onChanged: (_) {}),
                CheckboxListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset('images/twemoji_flag-france.svg'),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('France'),
                        ),
                      ],
                    ),
                    value: false,
                    onChanged: (_) {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
