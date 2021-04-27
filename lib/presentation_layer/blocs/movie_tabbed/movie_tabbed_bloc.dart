import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/entities/no_params.dart';
import 'package:movie_app/domain_layer/usecases/get_playing_now.dart';
import 'package:movie_app/domain_layer/usecases/get_popular.dart';
import 'package:movie_app/domain_layer/usecases/get_upcoming.dart';

part 'movie_tabbed_event.dart';

part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPlayingNow getPlayingNow;
  final GetUpComing getUpComing;
  final GetPopular getPopular;

  MovieTabbedBloc(
      {@required this.getPlayingNow,
      @required this.getUpComing,
      @required this.getPopular})
      : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabbedChangeEvent) {
      Either<AppError, List<MoviesEntities>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getUpComing(NoParams());
          break;
      }
      yield moviesEither
          .fold((l) => MovieTabbedError(currentTabIndex: event.currentTabIndex, errorType: l.errorMessage),
              (movies) {
        return MovieTabbedChanged(
            currentTabIndex: event.currentTabIndex, movies: movies);
      });
    }
  }
}
