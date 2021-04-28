import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class GetMovieDetails extends UseCase<MovieDetailEntities, MovieParams>{

  final MoviesRepositories repositories;
  GetMovieDetails(this.repositories);

  @override
  Future<Either<AppError, MovieDetailEntities>> call(MovieParams movieParams) async {
    return await repositories.getMovieDetails(movieParams.id);
  }
}