part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({this.currentTabIndex = 0})
      : assert(currentTabIndex >= 0, 'default index cant be less than 0');

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabbedChanged extends MovieTabbedState {
  final List<MoviesEntities> movies;

  const MovieTabbedChanged({int currentTabIndex, this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabbedError extends MovieTabbedState {

  final AppErrorType errorType;

  const MovieTabbedError({@required this.errorType, int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
