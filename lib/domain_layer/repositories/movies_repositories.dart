
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';

abstract class MoviesRepositories {

  // either (left -> app error, right -> list of movies)
  Future<Either<AppError, List<MoviesEntities>>> getTrending();
  Future<Either<AppError, List<MoviesEntities>>> getPopular();
  Future<Either<AppError, List<MoviesEntities>>> getPlayingNow();
  Future<Either<AppError, List<MoviesEntities>>> getUpComing();
  Future<Either<AppError, MovieDetailEntities>> getMovieDetails(int id);
}