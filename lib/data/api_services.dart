import 'dart:convert';
import 'package:chat_beeper/model/SignUp_Model.dart';
import 'package:http/http.dart' as http;
import 'package:chat_beeper/model/createComment.dart';

import '../model/Signin_model.dart';

class ApiServices {
  Future<SignUp> signUp(SignUp requestSignUpModel) async {
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath = '/user';

    final uri = Uri.https(authority, unencodedPath);
    final response = await http.post(uri, body: {requestSignUpModel.toJson()});

    if (response.statusCode == 201) {
      final String responseString = response.body;

      return signUpFromJson(responseString);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<dynamic> createComment() async {
    String authority = 'beeperchat.herokuapp.com';
    String unencodedPath = '/beep/6315fe0790e0ef30da0b8f05/comment';
    final userJwt;

    final uri = Uri.https(authority, unencodedPath);
    final response = await http.post(uri,
        headers: {"Authorization": "Bearer userJwt"}, body: {"text": 'uhmmm'});

    return response.body;
  }

  /*Future<LogIn> logIn() async {
    final uri = Uri.https('beeperchat.herokuapp.com', '/auth/login');
    final response = await http
        .post(uri, body: {"email": "email@emai3l.com", "password": "11111111"});
  }*/
}
