import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'fav_movie_card.dart';

class FavMoviesGridList extends StatelessWidget {
  final List<MoviesEntities> movies;

  const FavMoviesGridList({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.size_8.w),
        child: GridView.builder(
          itemCount: movies.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: AppSizes.size_16.w),
          itemBuilder: (context, index) {
            return FavMovieCard(movie: movies[index]);
          },
        ));
  }
}
