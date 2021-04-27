part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType errorType;

  const MovieCarouselError(this.errorType);
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MoviesEntities> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({this.movies, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cant be less than 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}
