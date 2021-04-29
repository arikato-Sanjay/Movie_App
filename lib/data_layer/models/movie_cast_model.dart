import 'package:movie_app/domain_layer/entities/movie_cast_entity.dart';

class MovieCastModel {
  int id;
  List<CastModel> cast;
  List<Crew> crew;

  MovieCastModel({this.id, this.cast, this.crew});

  MovieCastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = new List<CastModel>();
      json['cast'].forEach((v) {
        cast.add(new CastModel.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = new List<Crew>();
      json['crew'].forEach((v) {
        crew.add(new Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CastModel extends MovieCastEntity {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  CastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order})
      : super(
            creditId: creditId,
            name: name,
            posterPath: profilePath,
            characterPlayed: character);

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    return data;
  }
}

class Crew {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  String creditId;
  String department;
  String job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['job'] = this.job;
    return data;
  }
}
