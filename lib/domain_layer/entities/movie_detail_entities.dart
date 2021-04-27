import 'package:equatable/equatable.dart';

class MovieDetailEntities extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final String backdropPath;
  final String posterPath;

  const MovieDetailEntities(this.id, this.title, this.overview,
      this.releaseDate, this.voteAverage, this.backdropPath, this.posterPath);

  @override
  List<Object> get props => [id];
}
