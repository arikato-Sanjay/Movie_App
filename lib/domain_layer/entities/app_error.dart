//class that holds error message
import 'package:equatable/equatable.dart';

class AppError extends Equatable{

  final AppErrorType errorMessage;
  const AppError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

}

enum AppErrorType {api, network}