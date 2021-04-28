part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class MovieDetailLoadEvent extends MovieDetailsEvent {
  final int movieId;

  const MovieDetailLoadEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
