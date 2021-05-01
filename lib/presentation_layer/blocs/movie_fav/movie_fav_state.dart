part of 'movie_fav_bloc.dart';

abstract class MovieFavState extends Equatable {
  const MovieFavState();
}

class MovieFavInitial extends MovieFavState {
  @override
  List<Object> get props => [];
}

class FavMoviesLoaded extends MovieFavState {
  final List<MoviesEntities> movies;

  FavMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavMovieError extends MovieFavState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class FavMovieCheck extends MovieFavState {
  final bool checkFav;

  FavMovieCheck(this.checkFav);

  @override
  List<Object> get props => [checkFav];
}
