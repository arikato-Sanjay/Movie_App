part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}


//adding event, which will be dispatched when page changes in MoviePageView
class MovieBackdropLoadEvent extends MovieBackdropEvent {
  final MoviesEntities movies;

  const MovieBackdropLoadEvent(this.movies);

  @override
  List<Object> get props => [movies];
}