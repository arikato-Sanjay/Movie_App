import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/entities/no_params.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class GetFavMovies extends UseCase<List<MoviesEntities>, NoParams> {
  final MoviesRepositories moviesRepositories;

  GetFavMovies(this.moviesRepositories);

  @override
  Future<Either<AppError, List<MoviesEntities>>> call(NoParams noParams) async {
    return await moviesRepositories.getFavMovie();
  }
}
