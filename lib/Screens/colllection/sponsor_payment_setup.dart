import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';

class SponsorPaymentSetup extends StatefulWidget {
  const SponsorPaymentSetup({Key? key}) : super(key: key);

  @override
  State<SponsorPaymentSetup> createState() => _SponsorPaymentSetupState();
}

class _SponsorPaymentSetupState extends State<SponsorPaymentSetup> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );

    Appbar() {
      return PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: uColor,
            style: BorderStyle.solid,
          ))),
          child: SafeArea(
            child: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: darkModeOn == true ? Colors.white : Colors.black,
                      size: 20,
                    ),
                    onPressed: (() => Navigator.pop(context))),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 7),
                child: SvgPicture.asset(
                  'images/chatbeeper_blue.svg',
                  height: 34.h,
                  width: 34.w,
                ),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
            ),
          ),
        ),
      );
    }

    TextEditingController _cardNumber = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _expDateController = TextEditingController();
    TextEditingController _cvvController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: Appbar(),
      body: Padding(
        padding: EdgeInsets.only(top: 33.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('images/Secure.svg'),
            SizedBox(
              height: 13.h,
            ),
            Text(
              'Set up your payment',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                  color: darkModeOn ? Colors.white : bcolor1),
            ),
            SizedBox(
              height: 59.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 300.0.w),
              child: Text(
                'Secure server',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: darkModeOn ? Colors.white : bcolor1),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: 372.w,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  CreditCardNumberFormater(),
                  LengthLimitingTextInputFormatter(19),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.length < 3 || val.isEmpty) {
                    return 'Please input card number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                style: Theme.of(context).primaryTextTheme.subtitle1,
                controller: _cardNumber,
                decoration: InputDecoration(
                  suffixIconConstraints: BoxConstraints(maxWidth: 90.w),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset('images/visa.svg'),
                      SizedBox(
                        width: 12.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.0.w),
                        child: SvgPicture.asset('images/mastercard.svg'),
                      )
                    ],
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                        width: 2.w,
                        // color: _isvalid == true ? bcolor1: Colors.red),
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
                  hintText: 'Card Number',
                  labelText: 'Card Number',
                  labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
                  hintStyle: Theme.of(context).primaryTextTheme.bodyText2,
                  contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
                  // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                  focusColor: uColor,
                  // focusColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 372.w,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.length < 3 || val.isEmpty) {
                    return 'Enter your full name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                style: Theme.of(context).primaryTextTheme.subtitle1,
                controller: _nameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      borderSide: BorderSide(
                        width: 2.w,
                        // color: _isvalid == true ? bcolor1: Colors.red),
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
                  hintText: 'Full Name',
                  labelText: 'Full Name',
                  labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
                  hintStyle: Theme.of(context).primaryTextTheme.bodyText2,
                  contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
                  // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                  focusColor: uColor,
                  // focusColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 133.w,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.length < 3 || val.isEmpty) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                    controller: _expDateController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
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
                      hintText: 'Exp.Date',
                      labelText: 'Exp.Date',
                      labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
                      hintStyle: Theme.of(context).primaryTextTheme.bodyText2,
                      contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
                      // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                      focusColor: uColor,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 110.w,
                ),
                SizedBox(
                  width: 133.w,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.length < 3 || val.isEmpty) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                    controller: _cvvController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
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
                      hintText: 'CVV',
                      labelText: 'CVV',
                      labelStyle: Theme.of(context).primaryTextTheme.bodyText1,
                      hintStyle: Theme.of(context).primaryTextTheme.bodyText2,
                      contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
                      // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                      focusColor: uColor,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 87.h,
            ),
            SizedBox(
              height: 54.h,
              width: 400.w,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff295b85)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      side: const BorderSide(color: Colors.transparent),
                    ))),
                onPressed: () {},
                child: Text(
                  'Make payment',
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

// this class will be called, when their is change in textField
class CreditCardNumberFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < enteredData.length; i++) {
      // add each character into String buffer
      buffer.write(enteredData[i]);
      int index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        // add space after 4th digit
        buffer.write(" ");
      }
    }

    return TextEditingValue(
        text: buffer.toString(), // final generated credit card number
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}
