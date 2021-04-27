import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/screen_utils/screen_utils.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'animated_movie_card.dart';

class MoviePageView extends StatefulWidget {
  final List<MoviesEntities> movies;
  final int initialPage;

  const MoviePageView({Key key, this.movies, this.initialPage})
      : assert(initialPage >= 0, 'initial page cant be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.initialPage,
        keepPage: false,
        viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.size_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MoviesEntities movie = widget.movies[index];
          return AnimatedMovieCard(
            movieId: movie.id,
            posterPath: movie.posterPath,
            index: index,
            pageController: _pageController,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropLoadEvent(widget.movies[index]));
        },
      ),
    );
  }
}
