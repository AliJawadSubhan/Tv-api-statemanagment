import 'package:mvvmprovider/data/network/base_api_services.dart';
import 'package:mvvmprovider/data/network/network_api_service.dart';
import 'package:mvvmprovider/models/movies_model.dart';
import 'package:mvvmprovider/resources/app_urls.dart';

class HomeRepositry {
  BaseApiServices apiServices = NetworkApiServices();

  Future movieApi() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(ApiUrls.movieListUrl);
      response = MovieModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
