part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

//adding event, which will be dispatched when user comes to the screen
class CarouselLoadEvent extends MovieCarouselEvent {
  //will help us to decide which movie will be in center of carousel
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'default index cant be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
