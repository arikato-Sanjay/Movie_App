import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/usecases/get_movie_detail.dart';
import 'package:movie_app/presentation_layer/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_trailer/movie_trailer_bloc.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final MovieCastBloc movieCastBloc;
  final MovieTrailerBloc movieTrailerBloc;

  MovieDetailsBloc(
      {@required this.movieTrailerBloc,
      @required this.getMovieDetails,
      @required this.movieCastBloc})
      : super(MovieDetailsInitial());

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntities> eitherResponse =
          await getMovieDetails(MovieParams(event.movieId));

      yield eitherResponse.fold(
          (l) => MovieDetailsError(), (r) => MovieDetailsLoaded(r));

      movieCastBloc.add(MovieCastLoadEvent(movieId: event.movieId));
      movieTrailerBloc.add(MovieTrailerLoadEvent(movieId: event.movieId));
    }
  }
}
