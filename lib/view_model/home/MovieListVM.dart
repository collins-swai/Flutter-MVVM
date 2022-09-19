import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_in_lutter/data/response/ApiResponse.dart';
import 'package:mvvm_in_lutter/models/moviesList/MoviesMain.dart';
import 'package:mvvm_in_lutter/repository/movies/MovieRepoImpl.dart';

class MovieListVM extends ChangeNotifier {
  final _myRepo = MovieRepoImpl();

  ApiResponse<MoviesMain> movieMain = ApiResponse.loading();

  void _setMovieMain(ApiResponse<MoviesMain> response) {
    print("COLLINS :: $response");
    movieMain = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _setMovieMain(ApiResponse.loading());
    _myRepo
        .getMoviesList()
        .then((value) => _setMovieMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setMovieMain(ApiResponse.error(error.toString())));
  }
}
