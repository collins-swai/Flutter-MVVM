import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm_in_lutter/data/remote/BaseApiService.dart';
import 'package:mvvm_in_lutter/data/AppException.dart';

class NetworkAPIService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, String> JsonBody) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(Uri.parse(baseUrl + url), body: JsonBody);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
