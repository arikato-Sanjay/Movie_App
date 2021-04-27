import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/screen_utils/screen_utils.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_carousel/movie_card.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class AnimatedMovieCard extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCard(
      {Key key,
      @required this.index,
      @required this.movieId,
      @required this.posterPath,
      @required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: AppSizes.size_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      ScreenUtil.screenHeight *
                      0.35,
              width: AppSizes.size_230.w,
              child: child,
            ),
          );
        }
      },
      child: MoviesCard(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}
