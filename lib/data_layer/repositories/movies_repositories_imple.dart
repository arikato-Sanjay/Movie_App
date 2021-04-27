import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/data_layer/data_source/movies_remote_data.dart';
import 'package:movie_app/data_layer/models/movies_model.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';

class MoviesRepositoriesImplementation extends MoviesRepositories {

  final MoviesRemoteData remoteData;
  MoviesRepositoriesImplementation(this.remoteData);

  @override
  Future<Either<AppError, List<MoviesModel>>> getTrending() async {
    try{
      final movies = await remoteData.getTrending();
      return Right(movies);
    } on SocketException{
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getPlayingNow() async {
    try{
      final movies = await remoteData.getPlayingNow();
      return Right(movies);
    } on SocketException{
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getPopular() async {
    try{
      final movies = await remoteData.getPopular();
      return Right(movies);
    } on SocketException{
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntities>>> getUpComing() async {
    try{
      final movies = await remoteData.getUpComing();
      return Right(movies);
    } on SocketException{
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}