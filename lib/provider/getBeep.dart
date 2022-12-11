import 'package:chat_beeper/data/apiStatusResponse.dart';
import 'package:chat_beeper/data/api_layer.dart';
import 'package:chat_beeper/utility/appUrls.dart';
import 'package:chat_beeper/utility/baseController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/secure_storage.dart';
import '../model/get_beep_model.dart';
import 'package:http/http.dart' as http;


class GetBeepController extends BaseController{
  List<GetBeepModel> allBeeps =[];
  RxBool isLoading =false.obs;

  Future<List<GetBeepModel>> getBeep2(BuildContext context) async {
    isLoading.value=true;
    var res= await ApiService.makeApiCall(null,AppUrls.getBeeps,
    requireAccess: true,
    method: HTTP_METHODS.get);
    if(res is Success){
      try{
        var data = getBeepModelFromJson(res.response as String);
        if (data.isNotEmpty){
          allBeeps = data;
          isLoading.value=false;
          return allBeeps;
       }
      }catch(e){
        isLoading.value=false;
        print("This throws==>");
        print(e);
        return [];
      }
      return [];
    } else {
      isLoading.value=false;

      handleErrorResponse(res, context);
      return [];
    }
    isLoading.value=false;
    return [];
  }


  Future<List<GetBeepModel>> getBeep() async {
    print("Beep Called!");
    String authority = 'chatbeeper.onrender.com';
    String unencodedPath = '/beep';
    String? userJwt = await SecureStorage.getToken();
    print('Bearer------$userJwt');
    final uri = Uri.https(authority, unencodedPath);
    print("uri-------$uri");
    http.Response response =
    await http.get(uri, headers: {"Authorization": "Bearer $userJwt"});
    print('response------$response');
    print('Bearer------$userJwt');

    try {
      if (response.statusCode == 200) {
        print('this is response body${response.body}');
        return getBeepModelFromJson(response.body);
      } else {
        print(response.statusCode);
        return [];
        // throw Exception('can\'t load beeps');
      }
    } catch (e) {
      print("this is an exception====$e");
      return [];
    }

  }

  Future<void> editBeep(String body,{
    media =""
})async{
    Map<String, String> query = {"text":body, "media":media};

  }

}