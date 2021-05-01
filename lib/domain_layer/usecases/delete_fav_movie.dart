import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class DeleteFavMovie extends UseCase<void, MovieParams> {
  final MoviesRepositories moviesRepositories;

  DeleteFavMovie(this.moviesRepositories);

  @override
  Future<Either<AppError, void>> call(MovieParams params) async {
    return await moviesRepositories.deleteFavMovie(params.id);
  }
}
