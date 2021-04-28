import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/entities/movie_trailer_entities.dart';
import 'package:movie_app/domain_layer/usecases/get_movie_trailer.dart';

part 'movie_trailer_event.dart';

part 'movie_trailer_state.dart';

class MovieTrailerBloc extends Bloc<MovieTrailerEvent, MovieTrailerState> {
  final GetMovieTrailer getMovieTrailer;

  MovieTrailerBloc({@required this.getMovieTrailer})
      : super(MovieTrailerInitial());

  @override
  Stream<MovieTrailerState> mapEventToState(
    MovieTrailerEvent event,
  ) async* {
    if (event is MovieTrailerLoadEvent) {
      final Either<AppError, List<MovieTrailerEntities>> eitherResponse =
          await getMovieTrailer(MovieParams(event.movieId));

      yield eitherResponse.fold(
          (l) => NoMovieTrailer(), (r) => MovieTrailerLoaded(trailers: r));
    }
  }
}
