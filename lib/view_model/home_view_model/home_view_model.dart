import 'package:flutter/cupertino.dart';
import 'package:mvvmprovider/data/responce/api_response.dart';
import 'package:mvvmprovider/models/movies_model.dart';
import 'package:mvvmprovider/repositry/home_repositry.dart';

class HomeViewModel extends ChangeNotifier {
  final myHomeRepo = HomeRepositry();

  ApiResponse<MovieModel> moviesList = ApiResponse.loading();

  setMovies(ApiResponse<MovieModel> response)  {
    moviesList =  response;
    notifyListeners();
  }

  dynamic fetchMovieListApi() async {
     setMovies(ApiResponse.loading());

    myHomeRepo.movieApi().then((value) {

      setMovies(ApiResponse.completed(value));
      
    }).onError((error, stackTrace) {
      setMovies(ApiResponse.error(error.toString()));
    });
  }
}
