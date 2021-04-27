import 'package:movie_app/data_layer/core/api_client.dart';
import 'package:movie_app/data_layer/models/movies_model.dart';
import 'package:movie_app/data_layer/models/movies_result_model.dart';

abstract class MoviesRemoteData {
  Future<List<MoviesModel>> getTrending();
  Future<List<MoviesModel>> getPopular();
  Future<List<MoviesModel>> getPlayingNow();
  Future<List<MoviesModel>> getUpComing();
}

class MoviesRemoteDataImplementation extends MoviesRemoteData {
  final ApiClient _client;

  MoviesRemoteDataImplementation(this._client);

  @override
  Future<List<MoviesModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoviesModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoviesModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoviesModel>> getUpComing() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}