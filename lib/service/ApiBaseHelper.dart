import 'dart:developer';

import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:dio/dio.dart';

import 'ApiException.dart';

class ApiBaseHelper {
  final String _baseUrl = AppConstants.apiEndpoint;

  Future<dynamic> get(String word) async {
    print('Api Get, word $word');
    var responseJson;
    try {
      final response = await Dio().get(_baseUrl + word);
      responseJson = _returnResponse(response);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        _returnResponse(e.response!);
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
        throw FetchDataException('Error occurred while communicating with Server with StatusCode : 500', 500);
      }
    }
    print('Api Get Received Successfully!');
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    log("_returnResponse block => " + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data as List;
        var res = responseJson.map((i) => ResultModel.fromJson(i)).toList();
        return res;
      case 400:
      case 404:
        throw BadRequestException(response.statusCode.toString(), response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communicating with Server with StatusCode : ${response.statusCode}');
    }
  }
}
