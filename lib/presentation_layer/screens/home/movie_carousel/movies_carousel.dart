import 'package:flutter/material.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_carousel/movie_data.dart';
import 'package:movie_app/presentation_layer/widgets/movie_appbar.dart';
import 'package:movie_app/presentation_layer/widgets/separator.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_carousel/movie_backdrop.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_carousel/movie_page_view.dart';

class MoviesCarousel extends StatelessWidget {
  final List<MoviesEntities> movies;
  final int defaultIndex;

  const MoviesCarousel(
      {Key key, @required this.movies, @required this.defaultIndex})
      : assert(defaultIndex >= 0, 'default index cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdrop(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
                movies: movies,
                initialPage: defaultIndex
            ),
            MovieData(),
            Separator()
          ],
        )
      ],
    );
  }
}
