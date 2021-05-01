import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/dependency_injection/get_it.dart';
import 'package:movie_app/presentation_layer/blocs/movie_fav/movie_fav_bloc.dart';

import 'fav_movie_list.dart';

class FavMovieScreen extends StatefulWidget {
  @override
  _FavMovieScreenState createState() => _FavMovieScreenState();
}

class _FavMovieScreenState extends State<FavMovieScreen> {
  MovieFavBloc _movieFavBloc;

  @override
  void initState() {
    _movieFavBloc = getItInstance<MovieFavBloc>();
    _movieFavBloc.add(FavMovieLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _movieFavBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Movies'),
      ),
      body: BlocProvider.value(
        value: _movieFavBloc,
        child: BlocBuilder<MovieFavBloc, MovieFavState>(
          builder: (context, state) {
            if (state is FavMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    'No favourite movies',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              } else {
                return FavMoviesGridList(movies: state.movies);
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
