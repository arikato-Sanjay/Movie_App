part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

//to show loader
class MovieDetailsLoading extends MovieDetailsState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//handle error
class MovieDetailsError extends MovieDetailsState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//when loading is successful
class MovieDetailsLoaded extends MovieDetailsState {

  final MovieDetailEntities movieDetailEntities;

  const MovieDetailsLoaded(this.movieDetailEntities);

  @override
  List<Object> get props => [movieDetailEntities];
}
