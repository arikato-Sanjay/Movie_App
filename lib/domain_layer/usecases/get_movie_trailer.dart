import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/entities/movie_trailer_entities.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class GetMovieTrailer extends UseCase<List<MovieTrailerEntities>, MovieParams>{

  final MoviesRepositories repositories;
  GetMovieTrailer(this.repositories);

  @override
  Future<Either<AppError, List<MovieTrailerEntities>>> call(MovieParams movieParams) async {
    return await repositories.getMovieTrailer(movieParams.id);
  }
}