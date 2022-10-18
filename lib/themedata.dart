import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';

class AppTheme {
  //

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    primaryColor: bcolor3,
    scaffoldBackgroundColor: const Color(0xfffafafa),
    backgroundColor: Colors.white12,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: bcolor2,
      ),
    ),
    colorScheme: const ColorScheme.light(
        primary: bcolor,
        onPrimary: bcolor1,
        primaryVariant: bcolor3,
        primaryContainer: bcolor4,
        secondary: Colors.black38,
        secondaryVariant: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
      ), // get started and thers like it
      headline2: TextStyle(
        color: Colors.grey.shade700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ), //for grey subheading
      headline1: const TextStyle(
        color: bcolor1,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ), //FOR TOP
      headline3: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Nunito',
          fontSize: 20.sp), //for button
      headline4: TextStyle(
        color: Colors.grey.shade700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
      subtitle2: const TextStyle(
        color: Color(0xff386fa4),
        // fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: Colors.grey.shade700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ), //account name
      headline2: TextStyle(
          color: Colors.black87,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 20.sp), //agree to terms account
      bodyText1: TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500), //label texts
      headline5: TextStyle(
        color: Colors.white,
        fontFamily: 'Ubuntu',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 17.sp,
      ), //for subheadings after main Heading
      headline4: TextStyle(
        color: Colors.black,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 34.sp,
      ), //main heading
      headline3: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'Nunito',
          fontSize: 19.sp), //for buttons
      headline1: TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontSize: 20.sp), //label style
      bodyText2: TextStyle(
          color: uColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500), //hintstyle
      subtitle1: TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500), //textfield style
      subtitle2: TextStyle(
        color: Colors.black,
        fontFamily: 'Ubuntu',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 22.sp,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Nunito',
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    primaryColor: bcolor3,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme.dark(
        primary: bcolor,
        onPrimary: bcolor1,
        primaryVariant: bcolor2,
        primaryContainer: bcolor4,
        secondary: Colors.grey,
        secondaryVariant: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
      ), //for get started and others like it
      headline2: TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
      headline4: TextStyle(
        color: Colors.grey.shade700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
      subtitle2: const TextStyle(
        color: Color(0xff386fa4),
        // fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: Colors.grey.shade700,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 17.sp,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ), //account name
      headline2: TextStyle(
          color: Colors.black87,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 20.sp), //agree to terms account
      bodyText1: TextStyle(
          color: Colors.white,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500), //label texts
      headline5: TextStyle(
        color: Colors.white,
        fontFamily: 'Ubuntu',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 17.sp,
      ), //for subheadings after main Heading
      headline4: TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 34.sp,
      ), //create account
      headline3: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'Nunito',
          fontSize: 19.sp), //for buttons
      headline1:
          TextStyle(color: Colors.black, fontFamily: 'Nunito', fontSize: 20.sp),
      bodyText2: TextStyle(
          color: uColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500), //hintstyle
      subtitle1: TextStyle(
          color: Colors.white,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500), //textfield style
      subtitle2: TextStyle(
          color: Colors.white,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w400,
          fontSize: 22.sp,
          fontStyle: FontStyle.normal),
    ),
  );

  //   ),

}
