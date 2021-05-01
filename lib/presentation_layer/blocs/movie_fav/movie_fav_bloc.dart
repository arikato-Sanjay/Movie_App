import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movie_params.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/entities/no_params.dart';
import 'package:movie_app/domain_layer/usecases/check_fav.dart';
import 'package:movie_app/domain_layer/usecases/delete_fav_movie.dart';
import 'package:movie_app/domain_layer/usecases/get_fav_movie.dart';
import 'package:movie_app/domain_layer/usecases/save_movie.dart';

part 'movie_fav_event.dart';

part 'movie_fav_state.dart';

class MovieFavBloc extends Bloc<MovieFavEvent, MovieFavState> {
  final SaveMovie saveMovie;
  final GetFavMovies getFavMovies;
  final DeleteFavMovie deleteFavMovie;
  final CheckFavMovie checkFavMovie;

  MovieFavBloc(
      {@required this.saveMovie,
      @required this.getFavMovies,
      @required this.deleteFavMovie,
      @required this.checkFavMovie})
      : super(MovieFavInitial());

  @override
  Stream<MovieFavState> mapEventToState(
    MovieFavEvent event,
  ) async* {
    if (event is FavMovieToggleEvent) {
      if (event.isFav) {
        await deleteFavMovie(MovieParams(event.moviesEntities.id));
      } else {
        await saveMovie(event.moviesEntities);
      }
      final response =
          await checkFavMovie(MovieParams(event.moviesEntities.id));
      yield response.fold((l) => FavMovieError(), (r) => FavMovieCheck(r));
    } else if (event is FavMovieLoadEvent) {
      yield* _fetchFavMovies();
    } else if (event is FavMovieDeleteEvent) {
      await deleteFavMovie(MovieParams(event.movieId));
      yield* _fetchFavMovies();
    } else if (event is FavMovieCheckEvent) {
      final response = await checkFavMovie(MovieParams(event.movieId));
      yield response.fold((l) => FavMovieError(), (r) => FavMovieCheck(r));
    }
  }

  Stream<MovieFavState> _fetchFavMovies() async* {
    final Either<AppError, List<MoviesEntities>> eitherResponse =
        await getFavMovies(NoParams());
    yield eitherResponse.fold(
        (l) => FavMovieError(), (r) => FavMoviesLoaded(r));
  }
}
