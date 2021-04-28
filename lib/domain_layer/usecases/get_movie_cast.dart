import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_cast_entity.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class GetMovieCast extends UseCase<List<MovieCastEntity>, MovieParams> {
  final MoviesRepositories repositories;

  GetMovieCast(this.repositories);

  @override
  Future<Either<AppError, List<MovieCastEntity>>> call(
      MovieParams movieParams) async {
    return await repositories.getMovieCast(movieParams.id);
  }
}
