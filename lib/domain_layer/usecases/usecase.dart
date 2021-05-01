import 'package:dartz/dartz.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';

//to maintain uniformity in the codebase if number of developers join the
//project, as a solution abstract class is used

//<output, input>
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}