part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();
}

class SearchedMovieLoadEvent extends MovieSearchEvent {
  final String searchTerm;

  SearchedMovieLoadEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
