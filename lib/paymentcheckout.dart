import 'package:chat_beeper/Screens/sign_Up_personal.dart';
import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:chat_beeper/paymentcheckout.dart';
import 'package:chat_beeper/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';


class PaymentSponsored extends StatefulWidget {
  const PaymentSponsored({Key? key}) : super(key: key);

  @override
  State<PaymentSponsored> createState() => _PaymentSponsoredState();
}

class _PaymentSponsoredState extends State<PaymentSponsored> {
  String? fullname;
  final _cardnumber = TextEditingController();
  final _exp = TextEditingController();
  final _fnameTextController = TextEditingController();
  final _cvv = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration:  const BoxDecoration(
              border: Border(
                  bottom:
                  BorderSide(color: uColor, style: BorderStyle.solid))),
          child: SafeArea(
            child: AppBar(
              title: Padding(
                padding: EdgeInsets.only(top: 20.h,right: 20.w),
                child: SizedBox(
                    height: 34.h,
                    // width: 159.w,
                    child: SvgPicture.asset(
                      'images/chatbeeper_blue.svg',
                    )),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 33.h,),
          Center(
            child: SizedBox(
                height: 35.h,
                width: 35.w,
                child:
                    SvgPicture.asset('images/Secure.svg', color: darkModeOn == false? Colors.black:Colors.white,)
                    ),
          ),
          SizedBox(height: 13.h,),
          Center(
            child: Text('Set up your payment', style: TextStyle(color: darkModeOn ? Colors.white:Colors.black, fontWeight: FontWeight.w700, fontSize: 20.sp),),
          ),//write up
          SizedBox(height: 59.h,),
          Padding(
            padding:  EdgeInsets.only(right: 58.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Secure server', style: TextStyle(color:bcolor, fontWeight: FontWeight.w400, fontSize: 12.sp),)
              ],
            ),
          ),//write up
          SizedBox(height: 8.h,),
          SizedBox(
            width: 372.w,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
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
                  return 'Enter a valid phone number';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              style:
              Theme.of(context).primaryTextTheme.subtitle1,
              controller: _cardnumber,
              decoration: InputDecoration(
                floatingLabelBehavior:
                FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(
                      width: 2.w,
                      // color: _isvalid == true ? bcolor1: Colors.red),
                      color: bcolor1,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(6.r)),
                  borderSide:
                  BorderSide(width: 2.w, color: uColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                      width: 2.w, color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                      width: 2.w, color: Colors.red),
                ),
                errorStyle:
                TextStyle(height: 0, fontSize: 10.sp),
                labelText: 'Card Number',
                hintText: 'Card Number',
                labelStyle: Theme.of(context)
                    .primaryTextTheme
                    .bodyText1!.copyWith(fontSize: 15.sp, color: darkModeOn? Colors.white: Colors.black),
                hintStyle: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2!
                    .copyWith(fontSize: 15.sp, color: Colors.grey),
                contentPadding:
                EdgeInsets.only(top: 10.h, left: 10.w),
                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                focusColor: uColor,
              ),
            ),
          ), //card
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 372.w,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
                FilteringTextInputFormatter.allow(
                  RegExp(r"[a-zA-Z]+|\s"),
                )
              ],
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val!.length < 10 || val.isEmpty) {
                  return 'Enter a valid Card number';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              style:
              Theme.of(context).primaryTextTheme.subtitle1,
              controller: _fnameTextController,
              decoration: InputDecoration(
                floatingLabelBehavior:
                FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(6.r)),
                    borderSide: BorderSide(
                      width: 2.w,
                      // color: _isvalid == true ? bcolor1: Colors.red),
                      color: bcolor1,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(6.r)),
                  borderSide:
                  BorderSide(width: 2.w, color: uColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                      width: 2.w, color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                      width: 2.w, color: Colors.red),
                ),
                errorStyle:
                TextStyle(height: 0, fontSize: 10.sp),
                hintText: 'Full Name',
                labelText: 'Full Name',
                labelStyle: Theme.of(context)
                    .primaryTextTheme
                    .bodyText1!.copyWith(fontSize: 15.sp, color: darkModeOn? Colors.white: Colors.black),
                hintStyle: Theme.of(context)
                    .primaryTextTheme
                    .bodyText2!
                    .copyWith(fontSize: 15.sp, color: Colors.grey),
                contentPadding:
                EdgeInsets.only(top: 10.h, left: 10.w),
                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                focusColor: uColor,
                // focusColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ), //full name
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 372.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width:133.w, height: 48.h,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.length < 10 || val.isEmpty) {
                        return 'Enter a valid Card number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    style:
                    Theme.of(context).primaryTextTheme.subtitle1,
                    controller: _exp,
                    decoration: InputDecoration(
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
                            color: bcolor1,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6.r)),
                        borderSide:
                        BorderSide(width: 2.w, color: uColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w, color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w, color: Colors.red),
                      ),
                      errorStyle:
                      TextStyle(height: 0, fontSize: 10.sp),
                      hintText: 'Exp. Date',
                      labelText:  'Exp. Date',
                      labelStyle: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!.copyWith(fontSize: 15.sp, color: darkModeOn? Colors.white: Colors.black),
                      hintStyle: Theme.of(context)
                          .primaryTextTheme
                          .bodyText2!
                          .copyWith(fontSize: 15.sp, color: Colors.grey),
                      contentPadding:
                      EdgeInsets.only(top: 10.h, left: 10.w),
                      // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                      focusColor: uColor,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(
                  width:133.w, height: 48.h,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.length < 3 || val.isEmpty) {
                        return 'Enter a valid CVV number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    style:
                    Theme.of(context).primaryTextTheme.subtitle1,
                    controller: _cvv,
                    decoration: InputDecoration(
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(6.r)),
                          borderSide: BorderSide(
                            width: 2.w,
                            // color: _isvalid == true ? bcolor1: Colors.red),
                            color: bcolor1,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6.r)),
                        borderSide:
                        BorderSide(width: 2.w, color: uColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w, color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(6.r)),
                        borderSide: BorderSide(
                            width: 2.w, color: Colors.red),
                      ),
                      errorStyle:
                      TextStyle(height: 0, fontSize: 10.sp),
                      hintText: 'CVV',
                      labelText: 'CVV',
                      labelStyle: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1!.copyWith(fontSize: 15.sp, color: darkModeOn? Colors.white: Colors.black),
                      hintStyle: Theme.of(context)
                          .primaryTextTheme
                          .bodyText2!
                          .copyWith(fontSize: 15.sp, color: Colors.grey),
                      contentPadding:
                      EdgeInsets.only(top: 10.h, left: 10.w),
                      // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                      focusColor: uColor,
                      // focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),//cvv and exp date
          SizedBox(height: 87.h,),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSponsored(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Make payment',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3!
                        .copyWith(fontSize: 21.sp),
                    // TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w500,
                    //     fontFamily: 'Nunito',
                    //     fontSize: 17.sp
                    //
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
