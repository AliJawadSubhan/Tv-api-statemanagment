import 'package:mvvmprovider/data/network/base_api_services.dart';
import 'package:mvvmprovider/data/network/network_api_service.dart';
import 'package:mvvmprovider/resources/app_urls.dart';

class AuthRepositry {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponce(ApiUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUp(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponce(ApiUrls.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
