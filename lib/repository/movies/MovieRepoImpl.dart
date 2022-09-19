import 'dart:convert';
import 'package:mvvm_in_lutter/data/remote/ApiEndPoints.dart';
import 'package:mvvm_in_lutter/data/remote/BaseApiService.dart';
import 'package:mvvm_in_lutter/data/remote/NetworkAPIService.dart';
import 'package:mvvm_in_lutter/models/moviesList/MoviesMain.dart';
import 'package:mvvm_in_lutter/repository/movies/MovieRepo.dart';

class MovieRepoImpl implements MovieRepo {
  BaseApiService _apiService = NetworkAPIService();

  @override
  Future<MoviesMain?> getMoviesList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getMovies);
      print("SWAI $response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
      print("SWA_C $e");
    }
  }
}
