part of 'movie_trailer_bloc.dart';

abstract class MovieTrailerEvent extends Equatable {
  const MovieTrailerEvent();
}

class MovieTrailerLoadEvent extends MovieTrailerEvent{

  final int movieId;

  MovieTrailerLoadEvent({@required this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => throw [movieId];

}
