import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_cast_entity.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movie_trailer_entities.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';

abstract class MoviesRepositories {
  // either (left -> app error, right -> list of movies)
  Future<Either<AppError, List<MoviesEntities>>> getTrending();

  Future<Either<AppError, List<MoviesEntities>>> getPopular();

  Future<Either<AppError, List<MoviesEntities>>> getPlayingNow();

  Future<Either<AppError, List<MoviesEntities>>> getUpComing();

  Future<Either<AppError, MovieDetailEntities>> getMovieDetails(int id);

  Future<Either<AppError, List<MovieCastEntity>>> getMovieCast(int id);

  Future<Either<AppError, List<MovieTrailerEntities>>> getMovieTrailer(int id);

  Future<Either<AppError, List<MoviesEntities>>> getSearchedMovie(
      String searchTerm);

  //methods for fav db

  Future<Either<AppError, void>> saveFavMovie(MoviesEntities moviesEntities);

  Future<Either<AppError, List<MoviesEntities>>> getFavMovie();

  Future<Either<AppError, void>> deleteFavMovie(int movieId);

  Future<Either<AppError, bool>> checkFav(int movieId);
}
