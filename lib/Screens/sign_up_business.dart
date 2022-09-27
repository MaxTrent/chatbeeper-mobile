import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/gestures.dart';
import 'package:chat_beeper/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'upload_business_name.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z]");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidUname {
    final businessNameRegExp = RegExp(
        r"^[a-zA-Z0-9-_]([._-](?![._-])|[a-zA-Z0-9]){3,12}[a-zA-Z0-9-_]$"); //username is 8-20 characters long
    return businessNameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$'); //minimum 8 char
    return passwordRegExp.hasMatch(this);
  }

  // bool get isNotNull{
  //   return this!=null;
  // }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

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
  String? date;
  final format = DateFormat("dd-mm-yyyy");
  bool _visible = false;
  bool _isvalid = false;
  bool _expanded = false;
  int _currentPage = 1;
  var _emailTextController = TextEditingController();
  var _passwordTextController = TextEditingController();
  var _dateControlller = TextEditingController();
  var _phoneTextController = TextEditingController();
  var _bnameTextController = TextEditingController();
  var _pageController = PageController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  DateTime? birthday;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final firstDate = DateTime(DateTime.now().year - 120);
    final lastDate = DateTime.now();
    ScreenUtil.init(
      context,
      designSize: Size(485, 926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 108.h,
                  ),
                  Image.asset(
                    'images/logo1.png',
                    height: 90.h,
                    width: 90.h,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text('Create an account',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(fontSize: 32.sp)),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 8.r,
                        foregroundColor: Colors.black,
                        backgroundColor: bcolor3,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 158.w,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      CircleAvatar(
                        maxRadius: 8.r,
                        backgroundColor: Color(0xffD1E1EF),
                      ),
                      Container(
                        height: 0.5.h,
                        width: 158.w,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      CircleAvatar(
                        maxRadius: 8.r,
                        backgroundColor: Color(0xffD1E1EF),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  SizedBox(
                    width: 372.w,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 372.w,
                          child: TextFormField(
                              controller: _bnameTextController,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[a-zA-Z]+|\s")),
                                LengthLimitingTextInputFormatter(30),
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.text,
                              validator: ((value) {
                                if (value!.length < 2 || value.isEmpty) {
                                  return 'Enter your business name';
                                }
                                return null;
                              }),
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                hintText: 'Business name',
                                labelText: 'Business name',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                focusColor: uColor,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: bcolor1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: uColor)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: Colors.red)),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                              )),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 372.w,
                          child: TextFormField(
                              controller: _emailTextController,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.text,
                              validator: ((value) {
                                if (!value!.isValidEmail || value.isEmpty) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              }),
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                hintText: 'Email address',
                                labelText: 'Email address',
                                labelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                                contentPadding:
                                    EdgeInsets.only(top: 10.h, left: 10.w),
                                focusColor: uColor,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: bcolor1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: uColor)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.r)),
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: Colors.red)),
                                errorStyle:
                                    TextStyle(height: 0, fontSize: 10.sp),
                              )),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          width: 372.w,
                          child: TextFormField(
                            controller: _phoneTextController,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[0-9]"),
                              )
                            ],
                            validator: ((value) {
                              if (value!.isValidPhone ||
                                  value.length > 10 ||
                                  value.length < 10 ||
                                  value.isEmpty) {
                                return 'Enter a valid phone number';
                              }
                              return null;
                            }),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 10.0.w),
                                child: CountryCodePicker(
                                  barrierColor: Colors.grey,
                                  backgroundColor: CupertinoColors.systemGrey,
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: '+234',
                                  favorite: const ['+234', 'NG'],
                                  textStyle: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                  showFlag: false,
                                  boxDecoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1.w, color: uColor),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),

                                  //showFlagDialog: true,
                                  //comparator: (a, b) => b.name.compareTo(a.name),
                                  //Get the country information relevant to the initial selection
                                  //onInit: (code) => print("${code.name} ${code.dialCode}"),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  borderSide: BorderSide(
                                    width: 0.5.w,
                                    // color: _isvalid == true ? bcolor1: Colors.red),
                                    color: bcolor1,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r)),
                                borderSide:
                                    BorderSide(width: 0.5.w, color: uColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r)),
                                borderSide:
                                    BorderSide(width: 0.5.w, color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r)),
                                borderSide:
                                    BorderSide(width: 0.5.w, color: Colors.red),
                              ),
                              errorStyle: TextStyle(height: 0, fontSize: 10.sp),
                              labelText: 'Phone Number',
                              hintText: 'Phone Number',
                              labelStyle:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                              hintStyle: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 15.sp),
                              contentPadding:
                                  EdgeInsets.only(top: 10.h, left: 10.w),
                              // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                              focusColor: uColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        SizedBox(
                          height: 54.h,
                          width: 372.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (_emailTextController.text.isEmpty ||
                                      _phoneTextController.text.isEmpty ||
                                      _bnameTextController.text.isEmpty) {
                                    return Color(0xffD8D8D8);
                                  }
                                  return bcolor1;
                                }),

                                // elevation: ,
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                ))),
                            onPressed: () async {
                              if (_formKey1.currentState!.validate()) {
                                print(
                                    '${_phoneTextController.text.toString()}, ${_bnameTextController.text.toString()},${_emailTextController.text.toString()}');
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeIn);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Registration Incomplete',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.white)),
                                    backgroundColor: bcolor,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height -
                                                150.h,
                                        right: 20.w,
                                        left: 20.w),
                                  ),
                                );
                              }
                              return;
                            },
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline3!
                                  .copyWith(fontSize: 17.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(text: '', children: [
                                TextSpan(
                                  text:
                                      'By creating an account you agree with our',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                              ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(text: '', children: [
                                    TextSpan(
                                      text: 'Terms  of use',
                                      style: TextStyle(
                                          color: bcolor3,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.sp),
                                    ),
                                  ]),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'and',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                RichText(
                                  text: TextSpan(text: '', children: [
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                          color: bcolor3,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.sp),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
                key: _formKey2,
                child: Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 108.h,
                      ),
                      Image.asset(
                        'images/logo1.png',
                        height: 90.h,
                        width: 90.w,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Create an account',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(fontSize: 32.sp),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 28.w, right: 28.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 10.r,
                              foregroundColor: Colors.black,
                              backgroundColor: bcolor3,
                              child: Center(
                                child: const Icon(
                                  Icons.check_sharp,
                                  color: Colors.white,
                                  size: 8,
                                ),
                              ),
                            ),
                            Container(
                              height: 0.5.h,
                              width: 158.w,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            CircleAvatar(
                              maxRadius: 8.r,
                              backgroundColor: bcolor3,
                            ),
                            Container(
                              height: 0.5.h,
                              width: 155.w,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            CircleAvatar(
                              maxRadius: 8.r,
                              backgroundColor: Color(0xffD1E1EF),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      SizedBox(
                        width: 372.w,
                        child: Column(
                          children: [
                            SizedBox(
                                width: 372.w,
                                child: DateTimeField(
                                  controller: _dateControlller,
                                  format: format,
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2004),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2101),
                                        currentDate:
                                            currentValue ?? DateTime.now());
                                  },
                                  validator: (value) {
                                    if (_dateControlller.text.isEmpty) {
                                      return 'Date of birth is empty';
                                    }
                                    setState(() {
                                      value = birthday;
                                    });
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Date of Birth',
                                    labelText: 'DD/MM/YYYY',
                                    suffixIcon: Container(
                                      height: 10.h,
                                      width: 10.w,
                                      child: SvgPicture.asset(
                                        'images/calendar.svg',
                                        //fit: BoxFit.contain,
                                      ),
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.r)),
                                        borderSide: BorderSide(
                                          width: 0.5.w,
                                          // color: _isvalid == true ? bcolor1: Colors.red),
                                          color: bcolor1,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.r)),
                                        borderSide: BorderSide(
                                          width: 0.5.w,
                                          color: uColor,
                                        )),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.r)),
                                        borderSide: BorderSide(
                                          width: 0.5.w,
                                          color: Colors.red,
                                        )),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.r)),
                                        borderSide: BorderSide(
                                          width: 0.5.w,
                                          color: Colors.red,
                                        )),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SingleChildScrollView(),
        ],
      ),
    );
  }

  /*@override
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
}*/
}
