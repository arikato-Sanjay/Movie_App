import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/dependency_injection/get_it.dart';
import 'package:movie_app/presentation_layer/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_details/movie_details_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_fav/movie_fav_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_trailer/movie_trailer_bloc.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_cast.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_poster.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/trailer_button.dart';
import 'movie_detail_arguments.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsArguments movieDetailsArguments;

  const MovieDetailsScreen({Key key, @required this.movieDetailsArguments})
      : assert(movieDetailsArguments != null, 'argument cant be null'),
        super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsBloc _movieDetailsBloc;
  MovieCastBloc _movieCastBloc;
  MovieTrailerBloc _movieTrailerBloc;
  MovieFavBloc _movieFavBloc;

  @override
  void initState() {
    _movieDetailsBloc = getItInstance<MovieDetailsBloc>();
    _movieCastBloc = _movieDetailsBloc.movieCastBloc;
    _movieTrailerBloc = _movieDetailsBloc.movieTrailerBloc;
    _movieFavBloc = _movieDetailsBloc.movieFavBloc;
    _movieDetailsBloc
        .add(MovieDetailLoadEvent(widget.movieDetailsArguments.movieId));
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailsBloc?.close();
    _movieCastBloc?.close();
    _movieTrailerBloc?.close();
    _movieFavBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailsBloc),
          BlocProvider.value(value: _movieCastBloc),
          BlocProvider.value(value: _movieTrailerBloc),
          BlocProvider.value(value: _movieFavBloc)
        ],
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoaded) {
              final movieDetail = state.movieDetailEntities;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MoviePoster(movie: movieDetail),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.size_16.w,
                          vertical: AppSizes.size_8.h),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.size_16.w),
                      child: Text(
                        'Cast',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    MovieCast(),
                    TrailerButton(movieTrailerBloc: _movieTrailerBloc,)
                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
