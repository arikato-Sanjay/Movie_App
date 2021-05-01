part of 'movie_fav_bloc.dart';

abstract class MovieFavEvent extends Equatable {
  const MovieFavEvent();
}

class FavMovieLoadEvent extends MovieFavEvent {
  @override
  List<Object> get props => [];
}

class FavMovieDeleteEvent extends MovieFavEvent {
  final int movieId;

  FavMovieDeleteEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class FavMovieToggleEvent extends MovieFavEvent {
  final MoviesEntities moviesEntities;
  final bool isFav;

  FavMovieToggleEvent(this.moviesEntities, this.isFav);

  @override
  List<Object> get props => [moviesEntities, isFav];
}

class FavMovieCheckEvent extends MovieFavEvent {
  final int movieId;

  FavMovieCheckEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
