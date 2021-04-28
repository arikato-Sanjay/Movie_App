import 'package:movie_app/domain_layer/entities/movie_trailer_entities.dart';

class MovieTrailerModel {
  int id;
  List<MovieTrailer> trailers;

  MovieTrailerModel({this.id, this.trailers});

  MovieTrailerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      trailers = new List<MovieTrailer>();
      json['results'].forEach((v) {
        trailers.add(new MovieTrailer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.trailers != null) {
      data['results'] = this.trailers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieTrailer extends MovieTrailerEntities {
  final String id;
  final String iso6391;
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  MovieTrailer(
      {this.id,
      this.iso6391,
      this.iso31661,
      this.key,
      this.name,
      this.site,
      this.size,
      this.type})
      : super(title: name, key: key, type: type);

  factory MovieTrailer.fromJson(Map<String, dynamic> json) {
    return MovieTrailer(
      id: json['id'],
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      key: json['key'],
      name: json['name'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['key'] = this.key;
    data['name'] = this.name;
    data['site'] = this.site;
    data['size'] = this.size;
    data['type'] = this.type;
    return data;
  }
}
