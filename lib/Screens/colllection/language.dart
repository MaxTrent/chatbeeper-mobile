import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);
  static const String id = 'language';

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    bool? _isChecked = false;
    List<String> text = [
      "English",
      "Afrikans",
      "Portuguese",
      "Spanish",
      "Russian",
      "German",
      "Turkish",
      "French",
      "Italian"
    ];
    String _currText = ' ';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
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
                .copyWith(fontSize: 17.sp)),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 2.h,
          ),
          ListTile(
            dense: true,
            title: Text(
              'Language',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 17.sp),
            ),
          ),
          Divider(
            height: 16.h,
            thickness: 2.h,
          ),
          SingleChildScrollView(
            child: Column(
              children: text
                  .map((t) => CheckboxListTile(
                        activeColor: Colors.transparent,
                        checkColor: Colors.black,
                        title: Text(t),
                        value: _isChecked,
                        onChanged: (val) {
                          //val = true;
                          setState(() {
                            _isChecked = val!;
                            /*_isChecked = val!;
                            if (val == true) {
                              _currText = t;
                            }*/
                          });
                        },
                      ))
                  .toList(),
            ),
            /*child: Column(
              children: [
                
                Divider(
                  thickness: 2.h,
                ),
                ListTile(
                  dense: true,
                  title: Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'Language',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 17.sp),
                    ),
                  ),
                  onTap: null,
                ),
                Divider(
                  thickness: 2.h,
                ),
                SizedBox(
                  height: 24.0.h,
                ),
                ListTile(
                  title: Text('English'),
                ),
                
              ],
            ),
            */
          ),
        ],
      ),
    );
  }
}
