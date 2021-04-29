import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieSearchEntities extends Equatable {
  final String searchTerm;

  MovieSearchEntities({@required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];
}
