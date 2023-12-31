import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Screens/sign_Up_personal.dart';
import 'package:chat_beeper/Screens/sign_up_business.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import '../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colllection/home_page.dart';

class ConfirmRegister extends StatefulWidget {
  const ConfirmRegister({Key? key}) : super(key: key);
  static const String id = 'welcome-screen';

  @override
  State<ConfirmRegister> createState() => _ConfirmRegisterState();
}

class _ConfirmRegisterState extends State<ConfirmRegister> {
  bool navigateToPage = false;
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();

  Color firstColor = Colors.indigo;
  Color secondColor = Colors.grey.shade500;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/logo1.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    height: 115.h,
                  ),
                  Text(
                    'Hello,',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4!
                        .copyWith(fontSize: 48.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ), //hello
                  SizedBox(
                    width: 446.w,
                    height: 56.h,
                    child: Text(
                        'What type of account do \n you want to create?',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).primaryTextTheme.subtitle2),
                  ), //who
                  SizedBox(
                    height: 48.h,
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTileTheme(
                          data: ListTileThemeData(
                            selectedColor: bcolor1,
                            iconColor: _selectedIndex == 1 ? bcolor1 : fColor2,
                            textColor: _selectedIndex == 1 ? bcolor1 : fColor2,
                          ),
                          child: SizedBox(
                            height: 55.h,
                            width: 235.w,
                            child: ListTile(
                              horizontalTitleGap: 0.w,
                              visualDensity: null,
                              dense: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side: BorderSide(
                                    color:
                                        _selectedIndex == 1 ? bcolor1 : fColor2,
                                    width: 1.w),
                              ),
                              leading: Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.0.w, right: 8.w),
                                  child: SvgPicture.asset(
                                    'images/profile.svg',
                                    height: 20.h,
                                    color: fColor2,
                                  )),
                              title: Padding(
                                padding: EdgeInsets.only(right: 19.w),
                                child: Text('Personal Account',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          color: _selectedIndex == 2
                                              ? bcolor1
                                              : fColor2,
                                        )),
                              ),
                              onTap: () async {
                                _selectedIndex == 1;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount(),
                                    ));

                                // else if (_selectedIndex == 2) {
                                //   // navigate to the desired route
                                //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const CreateBusiness(),));
                                // }
                              },
                              selectedColor: bcolor5,
                            ),
                          ),
                        ), //personal
                        SizedBox(
                          height: 16.h,
                        ),
                        ListTileTheme(
                          data: ListTileThemeData(
                            selectedColor: bcolor1,
                            iconColor: _selectedIndex == 2 ? bcolor1 : uColor,
                            textColor: _selectedIndex == 2 ? bcolor1 : uColor,
                          ),
                          child: SizedBox(
                            height: 55.h,
                            width: 235.w,
                            child: ListTile(
                              horizontalTitleGap: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side: BorderSide(
                                    color:
                                        _selectedIndex == 2 ? bcolor1 : fColor2,
                                    width: 1),
                              ),
                              onTap: () async {
                                _selectedIndex == 2;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateBusiness(),
                                    ));

                                // else if (_selectedIndex == 2) {
                                //   // navigate to the desired route
                                //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const CreateBusiness(),));
                                // }
                              },
                              visualDensity: null,
                              dense: true,
                              leading: Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.0.w, right: 8.w),
                                  child: SvgPicture.asset(
                                    'images/briefcase.svg',
                                    height: 20.h,
                                    color: fColor2,
                                  )),
                              title: Padding(
                                padding: EdgeInsets.only(right: 19.w),
                                child: Text('Business Account',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 15.sp,
                                          color: _selectedIndex == 2
                                              ? bcolor1
                                              : fColor2,
                                        )
                                    //   TextStyle(
                                    //   fontWeight: FontWeight.w400,
                                    //     fontFamily: 'Nunito', fontSize: 17.sp, color:  _selectedIndex == 2 ? bcolor1 : uColor,
                                    // ),
                                    ),
                              ),
                            ),
                          ),
                        ), //business
                        SizedBox(
                          height: 207.h,
                        ),
                        // SizedBox(
                        //   height: 54.h,
                        //   width: 400.w,
                        //   child: ElevatedButton(
                        //     style: ButtonStyle(
                        //         backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        //                 (Set<MaterialState> states){
                        //               if (_selectedIndex == 1 || _selectedIndex == 2 ) return  bcolor1;
                        //               return uColor;
                        //             }
                        //         ),
                        //         // Color(
                        //         //     0xff295b85)
                        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(6.r),
                        //               side: const BorderSide(color: Colors.transparent),
                        //             )
                        //         )
                        //     ),
                        //     onPressed: () async {
                        //
                        //       if (_selectedIndex == 1 || _selectedIndex == 2 ) {
                        //         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const CreateAccount(),));
                        //       }
                        //       // else if (_selectedIndex == 2) {
                        //       //   // navigate to the desired route
                        //       //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const CreateBusiness(),));
                        //       // }
                        //     },
                        //     child:  Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text('Continue',
                        //           textAlign: TextAlign.center,
                        //           style:  TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w600,
                        //               fontFamily: 'Nunito',
                        //               fontSize: 17.sp
                        //
                        //           ),
                        //         ),
                        //         SizedBox(width: 8.w,),
                        //       ],
                        //     ),),
                        // ),//continue
                      ],
                    ),
                  ), //list tile persoanl and business
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
