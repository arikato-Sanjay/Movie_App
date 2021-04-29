import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_search_entities.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class GetSearchedMovie
    extends UseCase<List<MoviesEntities>, MovieSearchEntities> {
  final MoviesRepositories repositories;

  GetSearchedMovie(this.repositories);

  @override
  Future<Either<AppError, List<MoviesEntities>>> call(
      MovieSearchEntities searchParams) async {
    return await repositories.getSearchedMovie(searchParams.searchTerm);
  }
}
