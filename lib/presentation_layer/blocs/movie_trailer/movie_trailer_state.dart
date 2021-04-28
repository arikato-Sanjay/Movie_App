part of 'movie_trailer_bloc.dart';

abstract class MovieTrailerState extends Equatable {
  const MovieTrailerState();
}

class MovieTrailerInitial extends MovieTrailerState {
  @override
  List<Object> get props => [];
}

class MovieTrailerLoaded extends MovieTrailerState {
  final List<MovieTrailerEntities> trailers;

  const MovieTrailerLoaded({@required this.trailers});

  @override
  List<Object> get props => [trailers];
}

class NoMovieTrailer extends MovieTrailerState {
  @override
  List<Object> get props => [];
}
