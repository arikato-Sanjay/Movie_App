import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_search_entities.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/usecases/get_searched_movie.dart';

part 'movie_search_event.dart';

part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final GetSearchedMovie getSearchedMovie;

  MovieSearchBloc({@required this.getSearchedMovie})
      : super(MovieSearchInitial());

  @override
  Stream<MovieSearchState> mapEventToState(
    MovieSearchEvent event,
  ) async* {
    if (event is SearchedMovieLoadEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchedMovieLoading();
        final Either<AppError, List<MoviesEntities>> eitherResponse =
            await getSearchedMovie(
                MovieSearchEntities(searchTerm: event.searchTerm));

        yield eitherResponse.fold(
            (l) => SearchedMovieError(l.errorMessage), (r) => SearchedMovieLoaded(r));
      }
    }
  }
}
