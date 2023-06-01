import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_getx/data/network/base_api_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiResponse implements BaseApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic jasonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jasonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return jasonResponse;
  }

  @override
  Future postApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    //String basicAuth = 'Basic ' + base64Encode(utf8.encode('john@mail.com:changeme'));
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: body,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      case 500:
        throw ServerBackendException('Status code 500 ${response.body}');
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code ${response.statusCode}');
    }
  }
}
