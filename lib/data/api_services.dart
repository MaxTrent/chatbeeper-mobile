import 'dart:convert';
import 'package:chat_beeper/data/secure_storage.dart';
import 'package:chat_beeper/model/like_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Screens/colllection/home_page.dart';
import '../Screens/sign_in.dart';
import '../constants.dart';
import '../model/Signin_model.dart';
import '../model/get_comment_model.dart';
import '../model/otpmodel_email.dart';
import '../model/profile_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiServices {
  Future<VerifyEmailModel> verifyEmail(
      BuildContext context, String username, String email, String token) async {
    final response = await http.patch(
        Uri.https('beeperchat.herokuapp.com', 'auth/verify-token/email'),
        body: ({
          "username": username.toString(),
          "email": email.toString(),
          "token": 'test123' //otpcontroller.text
        }));
    if (response.statusCode == 201) {
      print('object');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
      return VerifyEmailModel.fromJson(json.decode(response.body));
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // return LogIn.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      print('object2');

      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body,
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
              bottom: MediaQuery.of(context).size.height - 150.h,
              right: 20.w,
              left: 20.w),
        ),
      );
      return VerifyEmailModel.fromJson(json.decode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect details',
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
              bottom: MediaQuery.of(context).size.height - 150.h,
              right: 20.w,
              left: 20.w),
        ),
      );
      throw Exception('Something went wrong');
    }
  } //verify email

  Future<void> verifyPhone(
      BuildContext context, String username, String phone, String token) async {
    final response = await http.patch(
        Uri.https('beeperchat.herokuapp.com', '/auth/verify-token/phone'),
        body: ({
          "username": username.toString(),
          "phone": phone.toString(),
          "token": "test123"
        }));
    if (response.statusCode == 201) {
      print('object');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
      // return VerifyEmailModel.fromJson(json.decode(response.body));
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // return LogIn.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      print('object2');

      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.body,
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
              bottom: MediaQuery.of(context).size.height - 150.h,
              right: 20.w,
              left: 20.w),
        ),
      );
      // return VerifyEmailModel.fromJson(json.decode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect details',
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
              bottom: MediaQuery.of(context).size.height - 150.h,
              right: 20.w,
              left: 20.w),
        ),
      );
      throw Exception('Something went wrong');
    }
  } //verify phone

  Future<LogInModel> logIn(
      BuildContext context, String email, String password) async {
    final response =
        await http.post(Uri.https('beeperchat.herokuapp.com', 'auth/login'),
            body: ({
              "email": email,
              "password": password,
            }));
    if (response.statusCode == 201) {
      var data = json.decode(response.body);

      print("Correct");
      // print(data['userId']);
      var jwtToken = data['jwt'];
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
      await SecureStorage.setToken(jwtToken);
      return LogInModel.fromJson(json.decode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Details',
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
              bottom: MediaQuery.of(context).size.height - 150.h,
              right: 20.w,
              left: 20.w),
        ),
      );

      throw Exception('Something went wrong');
    }
  } //sign in

  Future<GetProfileModel> getProfile(context) async {
    late GetProfileModel profileModel;
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath = '/user';

    final uri = Uri.https(authority, unencodedPath);
    String? userJwt = await SecureStorage.getToken();
    try {
      final response =
          await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        profileModel = GetProfileModel.fromJson(data);
      } else {
        throw 'Unable to retrieve profile details';
      }
    } catch (e) {
      print(e.toString());
    }
    return profileModel;
  } //get profile details

  Future<GetCommentModel> getComment(context) async {
    late GetCommentModel getCommentModel;
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        '/beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0';

    final uri = Uri.https(authority, unencodedPath);
    String? userJwt = await SecureStorage.getToken();
    try {
      final response =
          await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        getCommentModel = GetCommentModel.fromJson(data);
      } else {
        throw "Unable to retrieve posts.";
      }
    } catch (e) {
      print(e.toString());
    }
    return getCommentModel;
  } //get comment

  Future<void> deleteComment() async {
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        '/beep/6315fe0790e0ef30da0b8f05/comment/634579d5decf0c523d62a924';
    final uri = Uri.https(authority, unencodedPath);
    var userJwt = await SecureStorage.getToken();
    final response =
        await http.delete(uri, headers: {"Authorization": "Bearer $userJwt"});

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      } else {
        throw Exception("Unable to delete comment");
      }
    } catch (e) {
      print(e.toString());
    }
  } //delete comment

  Future<LikeCommentModel> likeComment() async {
    late LikeCommentModel likeCommentModel;
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        '/beep/6315fe0790e0ef30da0b8f05/comment/63457b4f755869fb5e88b411/unlike';
    final uri = Uri.https(authority, unencodedPath);
    var userJwt = await SecureStorage.getToken();
    final response =
        await http.patch(uri, headers: {"Authorization": "Bearer $userJwt"});

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        likeCommentModel = LikeCommentModel.fromJson(data);
      } else {
        throw Exception("Unable to like comment");
      }
    } catch (e) {
      print(e.toString());
    }
    return likeCommentModel;
  } //like comment

  Future<void> unlikeComment() async {
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        '/beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0/unlike';
    final uri = Uri.https(authority, unencodedPath);
    var userJwt = await SecureStorage.getToken();
    final response =
        await http.patch(uri, headers: {"Authorization": "Bearer $userJwt"});

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      } else {
        throw Exception("Unable to like comment");
      }
    } catch (e) {
      print(e.toString());
    }
  } //unlike comment

  Future<void> dislikeComment() async {
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        ' /beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0/dislike';
    final uri = Uri.https(authority, unencodedPath);
    var userJwt = await SecureStorage.getToken();
    final response =
        await http.patch(uri, headers: {"Authorization": "Bearer $userJwt"});

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      } else {
        throw Exception("Unable to like comment");
      }
    } catch (e) {
      print(e.toString());
    }
  } //dislike comment

  Future<void> undislikeComment() async {
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath =
        ' /beep/6315fe0790e0ef30da0b8f05/comment/631615c75f370c671d6377a0/undislike';
    final uri = Uri.https(authority, unencodedPath);
    var userJwt = await SecureStorage.getToken();
    final response =
        await http.patch(uri, headers: {"Authorization": "Bearer $userJwt"});

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      } else {
        throw Exception("Unable to like comment");
      }
    } catch (e) {
      print(e.toString());
    }
  } //undislike comment
}

Future<LogInModel> logIn(
    BuildContext context, String email, String password) async {
  final response =
      await http.post(Uri.https('beeperchat.herokuapp.com', 'auth/login'),
          body: ({
            "email": email,
            "password": password,
          }));
  if (response.statusCode == 201) {
    var data = json.decode(response.body);

    print("Correct");
    // print(data['userId']);
    var jwtToken = data['jwt'];
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
    await SecureStorage.setToken(jwtToken);
    return LogInModel.fromJson(json.decode(response.body));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invalid Details',
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
            bottom: MediaQuery.of(context).size.height - 150.h,
            right: 20.w,
            left: 20.w),
      ),
    );

    throw Exception('Something went wrong');
  }
}

Future<void> createBeep(String beep) async {
  final response =
      await http.post(Uri.https('beeperchat.herokuapp.com', '/feed'),
          body: ({
            "text": beep,
          }));

  if (response.statusCode == 201) {}
}
