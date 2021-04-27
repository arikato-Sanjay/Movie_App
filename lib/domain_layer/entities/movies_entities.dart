import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MoviesEntities extends Equatable{
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const MoviesEntities(
      {@required this.posterPath,
      @required this.id,
      @required this.backdropPath,
      @required this.title,
      @required this.overview,
      @required this.voteAverage,
      @required this.releaseDate})
      : assert(id != null, 'Movies Id must not be null');

  @override
  // overriding props with id and title
  List<Object> get props => [id, title];

  //now whenever movie object will be called then id and title will be visible
  // coz in props we are overriding id and title
  @override
  bool get stringify => true;
}
