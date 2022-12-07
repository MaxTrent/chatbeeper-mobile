import 'dart:convert';
import 'package:chat_beeper/Widgets/post_comment.dart';
import 'package:chat_beeper/data/secure_storage.dart';
import 'package:chat_beeper/model/create_comment_model.dart';
import 'package:chat_beeper/model/like_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Screens/colllection/home_page.dart';
import '../Screens/sign_in.dart';
import '../constants.dart';
import '../model/Signin_model.dart';
import '../model/create_beep_model.dart';
import '../model/get_beep_model.dart';
import '../model/get_comment_model.dart';
import '../model/otpmodel_email.dart';
import '../model/profile_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<VerifyEmailModel> verifyEmail(
    BuildContext context, String username, String email, String token) async {
  final response = await http.patch(
      Uri.https('chatbeeper.onrender.com', 'auth/verify-token/email'),
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
        duration: const Duration(seconds: 5),
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
        duration: const Duration(seconds: 5),
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
      Uri.https('chatbeeper.onrender.com', '/auth/verify-token/phone'),
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
        duration: const Duration(seconds: 5),
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
        duration: const Duration(seconds: 5),
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
      await http.post(Uri.https('chatbeeper.onrender.com', 'auth/login'),
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
  }
   if (response.statusCode == 404){
    var data = json.decode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text('User not found',
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
  }
   if (response.statusCode == 400){
    var data = json.decode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text('Something went wrong. try again',
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
  }
  if (response.statusCode == 401){
    var data = json.decode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text('Incorrect username/password',
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
  }
  throw Exception(response.body);
} //sign in

Future<GetProfileModel?> getProfile() async {
  String authority = 'chatbeeper.onrender.com';
  String unencodedPath = '/user';
  final uri = Uri.https(authority, unencodedPath);
  print("uri-------$uri");
  String? userJwt = await SecureStorage.getToken();
  http.Response response =
      await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
  print('response------$response');
  print('Bearer------$userJwt');

  try {
    if (response.statusCode == 200) {
      //  var data = jsonDecode(response.body);
      print("this is success");
      return getProfileModelFromJson(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  } catch (e) {
    print(e);
  }

  return null;
} //get profile details

Future<GetCommentModel> getComment(context) async {
  late GetCommentModel getCommentModel;
  String authority = 'chatbeeper.onrender.com';
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
  String authority = 'chatbeeper.onrender.com';
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
  String authority = 'chatbeeper.onrender.com';
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
  String authority = 'chatbeeper.onrender.com';
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
  String authority = 'chatbeeper.onrender.com';
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
  String authority = 'chatbeeper.onrender.com';
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

// Future<LogInModel> logIn(
//     BuildContext context, String email, String password) async {
//   final response =
//       await http.post(Uri.https('chatbeeper.onrender.com', 'auth/login'),
//           body: ({
//             "email": email,
//             "password": password,
//           }));
//   if (response.statusCode == 201) {
//     var data = json.decode(response.body);

//     print("Correct");
//     // print(data['userId']);
//     var jwtToken = data['jwt'];
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => const Home()));
//     await SecureStorage.setToken(jwtToken);
//     return LogInModel.fromJson(json.decode(response.body));
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Invalid Details',
//             style: Theme.of(context)
//                 .primaryTextTheme
//                 .bodyText1!
//                 .copyWith(color: Colors.white)),
//         backgroundColor: bcolor,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(6.r),
//         ),
//         margin: EdgeInsets.only(
//             bottom: MediaQuery.of(context).size.height - 150.h,
//             right: 20.w,
//             left: 20.w),
//       ),
//     );

//     throw Exception('Something went wrong');
//   }

Future<CreateBeepModel> createBeep(BuildContext context, String beep) async {
  late CreateBeepModel beepModel;
  var userJwt = await SecureStorage.getToken();
  final response =
      await http.post(Uri.https('chatbeeper.onrender.com', '/beep'),
          body: ({
            "text": beep,
          }),
          headers: {"Authorization": "Bearer $userJwt"});

  try {
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      beepModel = CreateBeepModel.fromJson(jsonDecode(response.body));
      print(beep);
      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    } else {
      throw Exception('unable to create beep');
    }
  } catch (e) {
    print(e.toString());
  }
  return beepModel;
}

Future<CreateCommentModel> createComment(
    BuildContext context, String comment) async {
  late CreateCommentModel commentModel;
  String authority = 'chatbeeper.onrender.com';
  String unencodedPath = '/beep/6315fe0790e0ef30da0b8f05/comment';
  String? userJwt = await SecureStorage.getToken();
  final uri = Uri.https(authority, unencodedPath);
  final response = await http.post(uri,
      headers: {"Authorization": "Bearer $userJwt"}, body: {"text": comment});
  print('token: $userJwt');
  // print(response.toString());

  try {
    if (response.statusCode == 201) {
      print('Success');
      print(comment);

      commentModel = CreateCommentModel.fromJson(jsonDecode(response.body));
      // Navigator.pop(context);
      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => const PostComment()));
      // if (!mounted) return;
    } else {
      throw Exception('Unable to create comment');
      // if (!mounted) return;
    }
  } catch (e) {
    print(e.toString());
  }
  return commentModel;
}

// Future<GetBeepModel> getBeep(BuildContext context) async {
//   late GetBeepModel getBeepModel;
//   String authority = 'chatbeeper.onrender.com';
//   String unencodedPath = '/beep/6315fe0790e0ef30da0b8f05/likes';
//   String? userJwt = await SecureStorage.getToken();
//   final uri = Uri.https(authority, unencodedPath);
//   final response =
//       await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
//   print(response.body);

//   if (response.statusCode == 200) {
//     getBeepModel = GetBeepModel.fromJson(jsonDecode(response.body));
//     print(getBeepModel);
//     return getBeepModel;
//   } else {
//     throw 'Unable to get beeps';
//   }
//   // print(getBeepModel);
//   // return getBeepModel;
// }

// Future<void> getBeep() async {
//   List<GetBeepModel> getBeep;
//   String authority = 'chatbeeper.onrender.com';
//   String unencodedPath = '/beep';
//   String? userJwt = await SecureStorage.getToken();
//   final uri = Uri.https(authority, unencodedPath);
//   final response =
//       await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
//   print(response.body);
//   List<dynamic> body = jsonDecode(response.body);

//   // print(getBeepModel);
//   // return getBeepModel;
// }
