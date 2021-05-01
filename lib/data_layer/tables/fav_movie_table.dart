import 'package:hive/hive.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';

part 'fav_movie_table.g.dart';

@HiveType(typeId: 0)
class FavMovieTable extends MoviesEntities {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  FavMovieTable({this.id, this.title, this.posterPath})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            overview: "",
            backdropPath: "",
            releaseDate: "",
            voteAverage: 0);

  factory FavMovieTable.fromMovieEntity(MoviesEntities moviesEntities) {
    return FavMovieTable(
        id: moviesEntities.id,
        title: moviesEntities.title,
        posterPath: moviesEntities.posterPath);
  }
}
