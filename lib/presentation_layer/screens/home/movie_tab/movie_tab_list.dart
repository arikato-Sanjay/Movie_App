import 'package:flutter/material.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_tab/movie_tab_card.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class MovieTabList extends StatelessWidget {
  final List<MoviesEntities> movies;

  const MovieTabList({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final MoviesEntities movie = movies[index];
          return MovieTabCard(
              movieId: movie.id,
              title: movie.title,
              posterPath: movie.posterPath);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14.w,
          );
        },
        itemCount: movies.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
