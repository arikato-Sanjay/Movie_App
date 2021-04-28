part of 'movie_cast_bloc.dart';

abstract class MovieCastEvent extends Equatable {
  const MovieCastEvent();
}

class MovieCastLoadEvent extends MovieCastEvent {
  final int movieId;

  MovieCastLoadEvent({@required this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [movieId];
}
