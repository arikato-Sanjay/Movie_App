part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

//adding event, which will be dispatched when user changes tab
class MovieTabbedChangeEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  const MovieTabbedChangeEvent({this.currentTabIndex = 0})
      : assert(currentTabIndex >= 0, 'default index cant be less than 0');

  @override
  List<Object> get props => [currentTabIndex];
}
