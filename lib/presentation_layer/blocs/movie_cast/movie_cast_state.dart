part of 'movie_cast_bloc.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();
}

class MovieCastInitial extends MovieCastState {
  @override
  List<Object> get props => [];
}

class MovieCastError extends MovieCastState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class MovieCastLoaded extends MovieCastState {
  final List<MovieCastEntity> movieCast;

  MovieCastLoaded({@required this.movieCast});

  @override
  List<Object> get props => [movieCast];
}
