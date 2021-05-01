import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class CheckFavMovie extends UseCase<bool, MovieParams> {
  final MoviesRepositories moviesRepositories;

  CheckFavMovie(this.moviesRepositories);

  @override
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await moviesRepositories.checkFav(params.id);
  }
}
