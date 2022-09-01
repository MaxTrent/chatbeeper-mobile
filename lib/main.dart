import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Screens/get_started.dart';
import 'package:chat_beeper/Screens/otp_email.dart';
import 'package:chat_beeper/Screens/profile_page.dart';
import 'package:chat_beeper/Widgets/Post.dart';
import 'package:chat_beeper/themedata.dart';
import 'package:flutter/material.dart';
import 'Screens/colllection/beep.dart';
import 'Screens/colllection/dm.dart';
import 'Screens/colllection/notifications.dart';
import 'Screens/colllection/tour_page.dart';
import 'Screens/confirm_Screen.dart';
import 'Screens/otp_failed.dart';
import 'Screens/otp_number.dart';
import 'Screens/otp_passed.dart';
import 'Screens/password_recovery.dart';
import 'Screens/sign_Up_personal.dart';
import 'Screens/sign_in.dart';
import 'Screens/sign_up_business.dart';
import 'Screens/splash_screen.dart';
import 'Screens/upload_business_name.dart';
import 'package:chat_beeper/Screens/colllection/timeline.dart';
import 'package:chat_beeper/Screens/choose_username.dart';
import 'package:chat_beeper/Screens/authenticate_signup.dart';
import 'package:chat_beeper/Screens/colllection/room.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (BuildContext context, child) => MaterialApp(
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SignIn.id: (context) => SignIn(),
          UploadBname.id: (context) => const UploadBname(),
          SplashScreen.id: (context) => SplashScreen(),
          CreateBusiness.id: (context) => const CreateBusiness(),
          ForgotPassword.id: (context) => const ForgotPassword(),
          CreateAccount.id: (context) => CreateAccount(),
          ConfirmRegister.id: (context) => const ConfirmRegister(),
          OtpAuth.id: (context) => const OtpAuth(),
          TourPage.id: (context) => const TourPage(),
          Timeline.id: (context) => const Timeline(),
          OtpFailed.id: (context) => const OtpFailed(),
          OtpPassed.id: (context) => const OtpPassed(),
          ChooseUsername.id: (context) => const ChooseUsername(),
          AuthenticateSignup.id: (context) => AuthenticateSignup(),
          OtpEmail.id: (context) => const OtpEmail(),
          Notifications.id: (context) => Notifications(),
          DirectMessage.id: (context) => DirectMessage(),
          Room.id: (context) => Room(),
          GetStarted.id: (context) => GetStarted(),
          PostCard.id: (context) => PostCard(),
          Profile.id: (context) => Profile(),
          Beep.id: (context) => Beep(),
          SettingsPage.id: (context) => SettingsPage(),
        },
      ),
    );
  }
}
