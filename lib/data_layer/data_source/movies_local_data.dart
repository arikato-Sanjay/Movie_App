import 'package:hive/hive.dart';
import 'package:movie_app/data_layer/tables/fav_movie_table.dart';

abstract class MoviesLocalData {
  Future<void> saveMovie(FavMovieTable favMovieTable);

  Future<List<FavMovieTable>> getFavMovies();

  Future<void> deleteFavMovies(int movieId);

  Future<bool> checkFav(int movieId);
}

class MoviesLocalDataImplementation extends MoviesLocalData {
  @override
  Future<bool> checkFav(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteFavMovies(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    movieBox.delete(movieId);
  }

  @override
  Future<List<FavMovieTable>> getFavMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieId = movieBox.keys;
    List<FavMovieTable> movies = [];
    movieId.forEach((element) {
      movies.add(movieBox.get(element));
    });
    return movies;
  }

  @override
  Future<void> saveMovie(FavMovieTable favMovieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(favMovieTable.id, favMovieTable);
  }
}
