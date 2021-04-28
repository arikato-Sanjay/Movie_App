import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieTrailerEntities extends Equatable {

  final String title, key, type;

  MovieTrailerEntities({@required this.title, @required this.key, @required this.type});

  @override
  List<Object> get props => [title];

  @override
  bool get stringify => true;

}