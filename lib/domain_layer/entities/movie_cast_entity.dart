import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieCastEntity extends Equatable {
  final String creditId;
  final String name;
  final String posterPath;
  final String characterPlayed;

  MovieCastEntity(
      {@required this.creditId,
      @required this.name,
      @required this.posterPath,
      @required this.characterPlayed});

  @override
  // TODO: implement props
  List<Object> get props => [creditId];
}
