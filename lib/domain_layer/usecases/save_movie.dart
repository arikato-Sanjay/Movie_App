import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/usecase.dart';

class SaveMovie extends UseCase<void, MoviesEntities> {
  final MoviesRepositories moviesRepositories;

  SaveMovie(this.moviesRepositories);

  @override
  Future<Either<AppError, void>> call(MoviesEntities params) async {
    return await moviesRepositories.saveFavMovie(params);
  }
}
