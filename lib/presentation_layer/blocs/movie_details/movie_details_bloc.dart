import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/usecases/get_movie_detail.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;

  MovieDetailsBloc({@required this.getMovieDetails})
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
    }
  }
}
