import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/apiStatusResponse.dart';
import '../model/defaultApiFailureResponse.dart';
import 'appUtil.dart';

class BaseController extends GetxController{

  String? _errorResponse;
  String? get errorResponse => _errorResponse;
  setErrorResponse(String? value) {
    _errorResponse = value;
  }

  handleErrorResponse(dynamic response, BuildContext context){
    if (response is Failure) {
      try {
        setErrorResponse(response.errorResponse as String);
     }
      catch (e) {
        setErrorResponse(response.errorResponse as String);
      }
    }else if(response is ForbiddenAccess){
      setErrorResponse(response.message);
    }else if(response is UnExpectedError){
      setErrorResponse(response.message);
    }else if(response is NetWorkFailure){
      setErrorResponse(response.message);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "$_errorResponse",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}