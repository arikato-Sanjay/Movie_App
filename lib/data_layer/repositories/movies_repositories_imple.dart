import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:movie_app/data_layer/data_source/movies_local_data.dart';
import 'package:movie_app/data_layer/data_source/movies_remote_data.dart';
import 'package:movie_app/data_layer/models/movie_cast_model.dart';
import 'package:movie_app/data_layer/models/movie_details_model.dart';
import 'package:movie_app/data_layer/models/movies_model.dart';
import 'package:movie_app/data_layer/tables/fav_movie_table.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_cast_entity.dart';
import 'package:movie_app/domain_layer/entities/movie_trailer_entities.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';

class MoviesRepositoriesImplementation extends MoviesRepositories {
  final MoviesRemoteData remoteData;
  final MoviesLocalData moviesLocalData;

  MoviesRepositoriesImplementation(this.remoteData, this.moviesLocalData);

  @override
  Future<Either<AppError, List<MoviesModel>>> getTrending() async {
    try {
      final movies = await remoteData.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getPlayingNow() async {
    try {
      final movies = await remoteData.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getPopular() async {
    try {
      final movies = await remoteData.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getUpComing() async {
    try {
      final movies = await remoteData.getUpComing();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final details = await remoteData.getMovieDetails(id);
      return Right(details);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getMovieCast(int id) async {
    try {
      final movieCast = await remoteData.getMovieCast(id);
      return Right(movieCast);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieTrailerEntities>>> getMovieTrailer(
      int id) async {
    try {
      final movieTrailer = await remoteData.getMovieTrailer(id);
      return Right(movieTrailer);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesModel>>> getSearchedMovie(
      String searchTerm) async {
    try {
      final searchedMovies = await remoteData.getSearchedMovies(searchTerm);
      return Right(searchedMovies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkFav(int movieId) async {
    try{
      final response = await moviesLocalData.checkFav(movieId);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavMovie(int movieId) async {
    try{
      final response = await moviesLocalData.deleteFavMovies(movieId);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getFavMovie() async {
    try{
      final response = await moviesLocalData.getFavMovies();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveFavMovie(
      MoviesEntities moviesEntities) async {
    try{
      final response = await moviesLocalData.saveMovie(FavMovieTable.fromMovieEntity(moviesEntities));
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}
