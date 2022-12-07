import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

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
    bool _switchValue = false;
    bool darkModeOn = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 40.h,
        elevation: 0.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkModeOn == true ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Padding(
          padding: EdgeInsets.only(top: 25.0.h),
          child: Text('Settings',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4!
                  .copyWith(fontSize: 17.sp)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              thickness: 0.5.h,
              color:uColor,
            ),
            ListTile(
              dense: true,
              title: Text(
                'Two-factor authetication',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4!
                    .copyWith(fontSize: 17.sp),
              ),
            ),
            Divider(
              height: 16.h,
              thickness: 0.5.h,
              color:uColor,
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              'Choose your security method',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 24.sp,
                    color: fColor,
                  ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              'Choose how you want us to send security\ncodes',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 17.sp,
                    color: Colors.grey,
                  ),
            ),
            SizedBox(height: 90.h),
            ListTile(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              dense: false,
              title: Text(
                'Text message',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4!
                    .copyWith(fontSize: 17.sp),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4.0.h),
                child: Text(
                    'We’ll send a login code to the number\nthat you choose.',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 17.sp)),
              ),
              trailing: CupertinoSwitch(
                  value: _switchValue, onChanged: (bool? value) {}),
            ),
            SizedBox(height: 24.0.h),
            ListTile(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              dense: false,
              title: Text(
                'WhatsApp',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4!
                    .copyWith(fontSize: 17.sp),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4.0.h),
                child: Text('We’ll send a login code to your whatsapp',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 17.sp)),
              ),
              trailing: CupertinoSwitch(
                value: _switchValue,
                onChanged: (bool? value) {
                  setState(() {
                    value = true;
                    _switchValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 24.0.h,
            ),
            ListTile(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              dense: false,
              title: Text(
                'Third party app',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4!
                    .copyWith(fontSize: 17.sp),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4.0.h),
                child: Text('Connect an app for verification',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 17.sp)),
              ),
              trailing: CupertinoSwitch(
                value: _switchValue,
                onChanged: (bool? value) {
                  setState(() {
                    value = true;
                    _switchValue = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoFactAddPhone extends StatefulWidget {
  const TwoFactAddPhone({Key? key}) : super(key: key);

  @override
  State<TwoFactAddPhone> createState() => _TwoFactAddPhoneState();
}

class _TwoFactAddPhoneState extends State<TwoFactAddPhone> {
  var _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  .copyWith(fontSize: 17.sp)),
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
                    .copyWith(fontSize: 17.sp),
              ),
            ),
            Divider(
              height: 16.h,
              thickness: 2.h,
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              'Add phone number',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 24.sp,
                    color: fColor,
                  ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              'Before we can confirm your WhatsApp\naccount, you need to add your phone number',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 17.sp,
                    color: Colors.grey,
                  ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              'We’ll send you a confirmation code next',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 17.sp,
                    color: Colors.grey,
                  ),
            ),
            SizedBox(height: 90.h),
            SizedBox(
              width: 372.w,
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  ),
                ],
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      showDropDownButton: true,
                      barrierColor: Colors.grey,
                      backgroundColor: CupertinoColors.systemGrey,
                      initialSelection: '+234',
                      favorite: const ['+234', 'NG'],
                      textStyle: Theme.of(context).primaryTextTheme.bodyText1,
                      showFlag: false,
                      boxDecoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: uColor),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                        width: 2.w,
                        color: bcolor1,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(width: 2.w, color: uColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(width: 2.w, color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(width: 2.w, color: Colors.red),
                  ),
                  errorStyle: TextStyle(height: 0, fontSize: 10.sp),
                  labelText: 'Phone Number',
                  hintText: 'Phone Number',
                  labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
                  hintStyle: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2!
                      .copyWith(fontSize: 15.sp),
                  contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
                  focusColor: uColor,
                ),
              ),
            ),
            SizedBox(
              height: 68.h,
            ),
            SizedBox(
              height: 54.h,
              width: 372.w,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff295B85)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      side: const BorderSide(color: Colors.transparent),
                    ))),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TwoFaVerification(),
                  ),
                ),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3!
                      .copyWith(fontSize: 17.sp),
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

class TwoFaVerification extends StatefulWidget {
  const TwoFaVerification({Key? key}) : super(key: key);

  @override
  State<TwoFaVerification> createState() => _2faVerificationState();
}

class _2faVerificationState extends State<TwoFaVerification> {
  final _formKey = GlobalKey<FormState>();
  final otpcontroller = TextEditingController();
  final focusNode = FocusNode();
  final int _value = 1;
  var email = 'JandeDoe@gmail,com';

  bool _otpfull = false;
  @override
  void dispose() {
    otpcontroller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 92.h),
            child: Image.asset(
              'images/verify.png',
              height: 137.h,
              width: 150.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(children: [
              SizedBox(width: 5.w, height: 32.h),
              Text('Verification',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle2!
                      .copyWith(fontSize: 25.sp, color: Colors.black)
                  // style: TextStyle(fontFamily: 'Anton', fontSize: 30),
                  ), //Authenticate
              SizedBox(width: 5.w, height: 0.03.h),
              Center(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                          'Please enter the 6 digit verification code sent to $email',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ), //AND WRITE UP, whois creating
              Padding(
                padding: EdgeInsets.only(top: 36.h, bottom: 30.h),
                child: Form(
                  key: _formKey,
                  child: OtpTextField(
                    cursorColor: Theme.of(context).colorScheme.secondaryVariant,
                    textStyle: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontSize: 25.sp),
                    hasCustomInputDecoration: false,
                    showFieldAsBox: false,
                    numberOfFields: 6,
                    borderColor: Colors.grey,
                    focusedBorderColor: Colors.grey,
                    disabledBorderColor: Colors.grey,
                    autoFocus: true,
                    clearText: true,
                    enabledBorderColor: Colors.grey,
                    onCodeChanged: (String code) {
                      _otpfull == true;
                    },
                    //runs when every textfield is filled
                    onSubmit: (String pin) {
                      _otpfull == true;
                      // setState(() {
                      //   // token == pin;
                      //   // print(pin);
                      // });
                    }, // end onSubmit
                  ),
                ),
              ),
              Text('Resend code after 60 seconds',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400)),

              SizedBox(height: 8.h),

              GestureDetector(
                onTap: _onResendTapped,
                child: Text('Resend Code',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline5!
                        .copyWith(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600)),
              ),
            ]),
          ),
          SizedBox(
            height: 34.h,
          ),
          SizedBox(
            height: 54.h,
            width: 372.w,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    fColor,
                  ),
                  // elevation: ,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    side: const BorderSide(color: Colors.transparent),
                  ))),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecoverCodes(),
                  )),
              child: Text(
                'Verify',
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline3,
                // TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.w500,
                //     fontFamily: 'Nunito',
                //     fontSize: 17.sp
                //
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onResendTapped() {
    //when resend code is tapped
  }
}

class RecoverCodes extends StatefulWidget {
  const RecoverCodes({Key? key}) : super(key: key);

  @override
  State<RecoverCodes> createState() => _RecoverCodesState();
}

class _RecoverCodesState extends State<RecoverCodes> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 40.h,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  .copyWith(fontSize: 17.sp)),
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
                    .copyWith(fontSize: 17.sp),
              ),
            ),
            Divider(
              height: 16.h,
              thickness: 2.h,
            ),
            SizedBox(
              height: 113.h,
            ),
            Text(
              'Recover Codes',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 24.sp,
                    color: fColor,
                  ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Save your backup code in a safe place. This\nenables you to log in to your acccount if you\nlose access to your phone.',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 24.h),
            Text(
              '2974JKLMUN01',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: 156.h,
            ),
            SizedBox(
              height: 54.h,
              width: 372.w,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      fColor,
                    ),
                    // elevation: ,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      side: const BorderSide(color: Colors.transparent),
                    ))),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecoverCodes(),
                    )),
                child: Text(
                  'Complete',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline3,
                  // TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w500,
                  //     fontFamily: 'Nunito',
                  //     fontSize: 17.sp
                  //
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
