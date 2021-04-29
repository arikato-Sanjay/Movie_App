part of 'movie_search_bloc.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();
}

class MovieSearchInitial extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class SearchedMovieLoaded extends MovieSearchState {
  final List<MoviesEntities> movies;

  SearchedMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchedMovieLoading extends MovieSearchState {
  @override
  List<Object> get props => [];
}

class SearchedMovieError extends MovieSearchState {
  final AppErrorType errorType;

  SearchedMovieError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
