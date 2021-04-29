import 'package:movie_app/data_layer/core/api_client.dart';
import 'package:movie_app/data_layer/models/movie_cast_model.dart';
import 'package:movie_app/data_layer/models/movie_details_model.dart';
import 'package:movie_app/data_layer/models/movie_trailer_model.dart';
import 'package:movie_app/data_layer/models/movies_model.dart';
import 'package:movie_app/data_layer/models/movies_result_model.dart';

abstract class MoviesRemoteData {
  Future<List<MoviesModel>> getTrending();

  Future<List<MoviesModel>> getPopular();

  Future<List<MoviesModel>> getPlayingNow();

  Future<List<MoviesModel>> getUpComing();

  Future<MovieDetailsModel> getMovieDetails(int id);

  Future<List<CastModel>> getMovieCast(int id);

  Future<List<MovieTrailer>> getMovieTrailer(int id);

  Future<List<MoviesModel>> getSearchedMovies(String searchTerm);
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

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final detailsResponse = await _client.get('movie/$id');
    final details = MovieDetailsModel.fromJson(detailsResponse);
    print(details);
    return details;
  }

  @override
  Future<List<CastModel>> getMovieCast(int id) async {
    final movieCastResponse = await _client.get('movie/$id/credits');
    final movieCast = MovieCastModel.fromJson(movieCastResponse).cast;
    print(movieCast);
    return movieCast;
  }

  @override
  Future<List<MovieTrailer>> getMovieTrailer(int id) async {
    final movieTrailerResponse = await _client.get('movie/$id/videos');
    final movieTrailer =
        MovieTrailerModel.fromJson(movieTrailerResponse).trailers;
    print(movieTrailer);
    return movieTrailer;
  }

  @override
  Future<List<MoviesModel>> getSearchedMovies(String searchTerm) async {
    final searchMovieResponse =
        await _client.get('search/movie', params: {'query': searchTerm});
    final searchMovie = MoviesResultModel.fromJson(searchMovieResponse).movies;
    print(searchMovie);
    return searchMovie;
  }
}
