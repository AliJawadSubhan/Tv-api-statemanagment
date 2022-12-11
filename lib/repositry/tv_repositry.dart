import 'package:mvvmprovider/data/network/base_api_services.dart';
import 'package:mvvmprovider/data/network/network_api_service.dart';
import 'package:mvvmprovider/models/movies_model.dart';
import 'package:mvvmprovider/models/tv_model.dart';
import 'package:mvvmprovider/resources/app_urls.dart';

class TvRepositry {
  BaseApiServices apiServices = NetworkApiServices();

  Future tvApi() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(ApiUrls.tvlistUrl);
      response = TvList.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
