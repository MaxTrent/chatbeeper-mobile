import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';

class TwoFactAuth extends StatefulWidget {
  const TwoFactAuth({Key? key}) : super(key: key);

  @override
  State<TwoFactAuth> createState() => _TwoFactAuthState();
}

class _TwoFactAuthState extends State<TwoFactAuth> {
  var _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 40.h,
        elevation: 0.h,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Padding(
          padding: EdgeInsets.only(left: 135.0.w),
          child: Text('Settings',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 16.sp)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              thickness: 2.h,
            ),
            ListTile(
              dense: true,
              title: Text(
                'Two-factor authetication',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4!
                    .copyWith(fontSize: 16.sp),
              ),
            ),
            Divider(
              height: 16.h,
              thickness: 2.h,
            ),
            SizedBox(
              height: 27.h,
            ),
            Center(
              child: Text(
                'Check if your phone number is on\nWhatsApp',
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                      fontSize: 24.sp,
                      color: fColor,
                    ),
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            Text(
              'We’ll send you a confirmation code next',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
            ),
            SizedBox(height: 90.h),
            SizedBox(
              width: 372.w,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  ),
                ],
                validator: (val) {
                  if (val!.isValidPhone ||
                      val.isEmpty ||
                      val.length > 10 ||
                      val.length < 10) {
                    return 'Enter valid phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                style: Theme.of(context).primaryTextTheme.subtitle1,
                controller: _phoneNumber,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: CountryCodePicker(
                      barrierColor: Colors.grey,
                      backgroundColor: CupertinoColors.systemGrey,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: '+234',
                      favorite: const ['+234', 'NG'],
                      textStyle: Theme.of(context).primaryTextTheme.bodyText1,
                      showFlag: false,
                      boxDecoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: uColor),
                        borderRadius: BorderRadius.circular(6.r),
                      ),

                      //showFlagDialog: true,
                      //comparator: (a, b) => b.name.compareTo(a.name),
                      //Get the country information relevant to the initial selection
                      //onInit: (code) => print("${code.name} ${code.dialCode}"),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                        width: 0.5.w,
                        // color: _isvalid == true ? bcolor1: Colors.red),
                        color: bcolor1,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(width: 0.5.w, color: uColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(width: 0.5.w, color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(width: 0.5.w, color: Colors.red),
                  ),
                  errorStyle: TextStyle(height: 0, fontSize: 10.sp),
                  labelText: 'Phone Number',
                  hintText: 'Phone Number',
                  labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
                  hintStyle: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2!
                      .copyWith(fontSize: 14.sp),
                  contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
                  // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                  focusColor: uColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension StringEx on String {
  bool get isValidPhone {
    final phoneReg = RegExp(r"^\+?0[0-9]{10}$");
    return phoneReg.hasMatch(this);
  }
}
