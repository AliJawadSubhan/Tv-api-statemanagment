import 'package:flutter/cupertino.dart';
import 'package:mvvmprovider/data/responce/api_response.dart';
import 'package:mvvmprovider/models/tv_model.dart';
import 'package:mvvmprovider/repositry/tv_repositry.dart';

class TvViewModel extends ChangeNotifier {
  final myHomeRepo = TvRepositry();

  ApiResponse<TvList> tvList = ApiResponse.loading();

  setTv(ApiResponse<TvList> response)  {
    tvList =  response;
    notifyListeners();
  }

  dynamic fetchTvListApi() async {
     setTv(ApiResponse.loading());

    myHomeRepo.tvApi().then((value) {

      setTv(ApiResponse.completed(value));
      
    }).onError((error, stackTrace) {
      setTv(ApiResponse.error(error.toString()));
    });
  }
}
