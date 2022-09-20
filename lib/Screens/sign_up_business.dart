import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/gestures.dart';
import 'package:chat_beeper/constants.dart';
import 'upload_business_name.dart';
String _verticalGroupValue = "Male";

List<String> _status = ["Male", "Female", "Others"];
String dropdownValue = 'One';
class CreateBusiness extends StatefulWidget {
  const CreateBusiness({Key? key}) : super(key: key);
  static const String id = 'confirm-screen';

  @override
  State<CreateBusiness> createState() => _CreateBusinessState();
}

class _CreateBusinessState extends State<CreateBusiness> {
  String? email;
  String? password;
  String? bname;
  String? mobile;
  String? dob;
  final format = DateFormat("dd-MM-yyyy");
  bool _visible = false;


  final _formKey = GlobalKey<FormState>();
  var _emailTextController = TextEditingController();
  var _passwordTextController = TextEditingController();
  var _birthdateControlller = TextEditingController();
  var _phoneTextController = TextEditingController();
  var _bnameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(485,926));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final firstDate = DateTime(DateTime.now().year - 120);
    final lastDate = DateTime.now();
    return Scaffold(
        backgroundColor: bcolor3,
        body: Form(
            key: _formKey,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40.r), topLeft: Radius.circular(40.r),)
                      // borderRadius: BorderRadius.only( topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                    ),
                    height:725.h,
                    width:width,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 17.w, right: 17.w, bottom: 12.h,top: 12.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 50.h,
                            child: TextFormField(
                              style:Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize:20.sp),
                              controller: _bnameTextController,
                              keyboardType: TextInputType.name,
                              decoration:   InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width: 1.5.w,
                                      color: bcolor3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width:0.5.w,
                                      color: bcolor3),
                                ),


                                hintText: 'Business Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 20.sp),
                                contentPadding:  EdgeInsets.only(top:10.h, left: 10.w ),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,


                                focusColor: bcolor3,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //business name
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(
                            height: 50.h,
                            child: DateTimeField(

                              style:Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize: 15.sp),

                              controller: _birthdateControlller,
                              decoration:    InputDecoration(

                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width: 0.5.w,
                                      color: bcolor1),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width: 0.5.w,
                                      color: bcolor1),
                                ),


                                hintText: 'Date of Birth',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 15.sp),
                                contentPadding:  EdgeInsets.only(top:10.h, left: 10.w ),
                                focusColor: uColor,
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                              format: format,
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    currentDate: currentValue ?? DateTime.now(),
                                    firstDate: DateTime(1900),
                                    initialDate: DateTime(2004),
                                    lastDate: DateTime(2101));
                              },),
                          ),//date 0f birth
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 50.h,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style:Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize:20.sp),
                              controller: _phoneTextController,
                              decoration:   InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width: 1.5.w,
                                      color: bcolor3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width:0.5.w,
                                      color: bcolor3),
                                ),


                                hintText: 'Phone Number',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 20.sp),
                                contentPadding:  EdgeInsets.only(top:10.h, left: 10.w ),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,


                                focusColor: bcolor3,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),//phone
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 50.h,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: Theme.of(context).primaryTextTheme.subtitle1,
                              controller: _emailTextController,
                              decoration:   InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width: 1.5.w,
                                      color: bcolor3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width:0.5.w,
                                      color: bcolor3),
                                ),


                                hintText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 20.sp),
                                contentPadding:  EdgeInsets.only(top:10.h, left: 10.w ),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,


                                focusColor: bcolor3,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),//email
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(
                            height: 50.h,
                            child: TextFormField(

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is empty';
                                }
                                if (value.length < 6) {
                                  return 'Minimum 6 characters';
                                }
                                setState(() {
                                  password = value;
                                });
                                return null;
                              },
                              obscureText: _visible == false ? true : false,

                              style:Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontSize:20.sp),
                              controller: _passwordTextController,
                              decoration:   InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width: 1.5.w,
                                      color: bcolor3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                                  borderSide:BorderSide(
                                      width:0.5.w,
                                      color: bcolor3),
                                ),
                                suffixIcon: IconButton(
                                  color: Colors.black,
                                  icon: _visible
                                      ? Icon(Icons.visibility_outlined)
                                      : Icon(Icons.visibility_off_outlined),
                                  onPressed: () {
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  },
                                ),
                                hintText: 'Password',
                                hintStyle:Theme.of(context).primaryTextTheme.bodyText2!.copyWith(fontSize: 20.sp),
                                contentPadding:  EdgeInsets.only(top:10.h, left: 10.w ),
                                // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,


                                focusColor: bcolor3,
                                // focusColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ), //password
                          SizedBox(
                            height: 116.h,
                          ),
                          SizedBox(
                            height: 54.h,
                            width: 249.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color(
                                      0xff295b85)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45.52.r),
                                        side: const BorderSide(color: Colors.transparent),
                                      )
                                  )
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const UploadBname(),
                                )
                                );
                              },
                              child:  Text('Next',
                                  textAlign: TextAlign.center,
                                  style:Theme.of(context).primaryTextTheme.headline3!.copyWith(fontSize: 20.sp)),),
                          ),//Next

                        ],
                      ),
                    ),
                  ),
                ),//column field
                Positioned(
                  top: 80.h,
                  left: 90.w,
                  child: Center(child: Text('Create Your Business Account', style:  Theme.of(context).primaryTextTheme.headline4!.copyWith(fontSize: 22.sp),)),
                ),//main heading
                Positioned(
                  top: 120.h,
                  left: 150.w,
                  child: Center(child: Text('Please enter your details below', style:  Theme.of(context).primaryTextTheme.headline5!.copyWith(fontSize: 15.sp),)),
                ),//subheading
                Positioned(
                  top: 158.h,
                  left: 190.w,
                  child: Center(
                    child: Container(
                      height: 85.h,
                      width: 93.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/logo.png',),
                            fit: BoxFit.contain
                        ),),
                    ),
                  ),
                ),//image
              ],
            )
        ),
      );
  }
}
