import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain_layer/entities/app_error.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/domain_layer/entities/no_params.dart';
import 'package:movie_app/domain_layer/usecases/get_trending.dart';
import 'package:movie_app/presentation_layer/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';

part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(
      {@required this.movieBackdropBloc, @required this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final eitherMovies = await getTrending(NoParams());
      // r = movies
      yield eitherMovies.fold((l) => MovieCarouselError(l.errorMessage), (movies) {
        movieBackdropBloc
            .add(MovieBackdropLoadEvent(movies[event.defaultIndex]));
        return MovieCarouselLoaded(
            movies: movies, defaultIndex: event.defaultIndex);
      });
    }
  }
}
