import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../model/defaultApiFailureResponse.dart';
import '../utility/appUrls.dart';
import '../utility/appUtil.dart';
import '../utility/userUtil.dart';
import 'package:http/http.dart' as http;

import 'apiStatusResponse.dart';

enum HTTP_METHODS {
  post, put, patch, get, delete
}

class ApiService {
  static Future<Object> makeApiCall(dynamic request, String endpoint,
      {bool requireAccess = true,
        HTTP_METHODS method = HTTP_METHODS.post}) async {
    try {
      var url = Uri.https(endpoint);
      var body = request != null ? json.encode(request.toJson()) : null;
      var headers = requireAccess ? {
        'Authorization': 'Bearer $userAccessToken',
      } : {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      AppUtils.debug("/****rest call request starts****/");
      AppUtils.debug("url: $url");
      AppUtils.debug("headers: $headers");
      AppUtils.debug("body: $body");
      Response? response;
      switch (method) {
        case HTTP_METHODS.post:
          response = await http.post(url,
              headers: headers,
              body: body
          );
          break;
        case HTTP_METHODS.put:
          response = await http.put(url,
              headers: headers,
              body: body
          );
          break;
        case HTTP_METHODS.patch:
          response = await http.patch(url,
              headers: headers,
              body: body
          );
          break;
        case HTTP_METHODS.get:
          AppUtils.debug("trying a get request");
          response = await http.get(url,
              headers: headers
          );
          break;
        case HTTP_METHODS.delete:
          response = await http.delete(url,
              headers: headers,
              body: body
          );
          break;
      }

      AppUtils.debug("/****rest call response starts****/");
      AppUtils.debug("status code: ${response.statusCode}");
      AppUtils.debug("rest response: ${response.body}");
      if (ApiResponseCodes.success == response.statusCode) {
        return Success(response.statusCode, response.body);
      }
      if (ApiResponseCodes.error == response.statusCode) {
        return Failure(
            response.statusCode, (defaultApiResponseFromJson(response.body)));
      }
      if (ApiResponseCodes.authorizationError == response.statusCode) {
        return ForbiddenAccess();
      }
      else {
        return Failure(response.statusCode, "Error Occurred");
      }
    } on HttpException {
      return NetWorkFailure();
    } on FormatException {
      return UnExpectedError();
    } catch (e) {
      return UnExpectedError();
    }
  }

  static Future<Object> getApiCallWithQueryParams(Map<String, String> query,
      String endpoint,
      {bool requireAccess = true, bool isAdmin = false}) async {
    try {
      var headers = requireAccess ? {
        'Accept': 'application/json',
        'Authorization': 'Bearer $userAccessToken',
      } : {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var url = Uri.http(AppUrls.base_url, endpoint, query);
      AppUtils.debug("/****rest call request starts****/");
      AppUtils.debug("url: $url");
      AppUtils.debug("headers: $headers");
      var response = await http.get(url,
        headers: headers,
      );
      AppUtils.debug("/****rest call response starts****/");
      AppUtils.debug("status code: ${response.statusCode}");
      AppUtils.debug("rest response: " + response.body);
      if (ApiResponseCodes.success == response.statusCode) {
        return Success(response.statusCode, response.body);
      }
      if (ApiResponseCodes.error == response.statusCode ||
          ApiResponseCodes.internalServerError == response.statusCode) {
        return Failure(
            response.statusCode, (defaultApiResponseFromJson(response.body)));
      }
      if (ApiResponseCodes.authorizationError == response.statusCode) {
        return ForbiddenAccess();
      }
      else {
        return Failure(response.statusCode, "Error Occurred");
      }
    } on HttpException {
      return NetWorkFailure();
    } on FormatException {
      return UnExpectedError();
    } catch (e) {
      return UnExpectedError();
    }
  }
}