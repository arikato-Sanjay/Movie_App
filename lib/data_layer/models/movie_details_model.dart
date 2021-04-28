import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';

class MovieDetailsModel extends MovieDetailEntities {
  final String backdropPath;
  final int id;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;

  MovieDetailsModel({
    this.backdropPath,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  }) : super(
            id: id,
            title: title,
            overview: overview,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            backdropPath: backdropPath,
            posterPath: posterPath);

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    return data;
  }
}

