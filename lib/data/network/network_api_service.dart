import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvmprovider/data/app_exceptions/app_exceptions.dart';
import 'package:mvvmprovider/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic jsonresponse;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 12),
          );
      jsonresponse = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Coneection');
    }

    return jsonresponse;
  }

  @override
  Future getPostApiResponce(String url, dynamic data) async {
    dynamic jsonresponse;
    try {
      // ignore: unused_local_variable
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 6));
      jsonresponse = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Coneection');
    }

    return jsonresponse;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(
        response.body,
      );
      return responseJson;
    case 400:
      throw BadRequestExcption(
        response.body.toString(),
      );
    case 404:
      throw UnAuthorizedException(
        response.body.toString(),
      );
    default:
      throw FetchDataExceptions(
        'Error Occured while communication with the server ${response.statusCode}',
      );
  }
}
