import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_cast_entity.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/usecases/get_movie_cast.dart';

part 'movie_cast_event.dart';

part 'movie_cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final GetMovieCast getMovieCast;

  MovieCastBloc({@required this.getMovieCast}) : super(MovieCastInitial());

  @override
  Stream<MovieCastState> mapEventToState(
    MovieCastEvent event,
  ) async* {
    if (event is MovieCastLoadEvent) {
      Either<AppError, List<MovieCastEntity>> eitherResponse =
          await getMovieCast(MovieParams(event.movieId));

      yield eitherResponse.fold(
          (l) => MovieCastError(), (r) => MovieCastLoaded(movieCast: r));
    }
  }
}
