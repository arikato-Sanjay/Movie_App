import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/routes_list.dart';
import 'package:movie_app/presentation_layer/screens/home/home_screen.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/presentation_layer/screens/movie_fav/fav_movie_screen.dart';
import 'package:movie_app/presentation_layer/screens/movie_trailers/trailer_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RoutesList.initial: (context) => HomeScreen(),
        RoutesList.movieDetail: (context) =>
            MovieDetailsScreen(movieDetailsArguments: settings.arguments),
        RoutesList.movieTrailer: (context) =>
            MovieTrailerScreen(movieTrailerArguments: settings.arguments),
        RoutesList.movieFav: (context) => FavMovieScreen(),
      };
}
