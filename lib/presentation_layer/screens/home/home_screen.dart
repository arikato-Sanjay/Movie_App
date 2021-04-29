import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/dependency_injection/get_it.dart';
import 'package:movie_app/presentation_layer/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_search/movie_search_bloc.dart';
import 'file:///E:/Tutorials/Projects/AndroidProjects/movie_app/lib/presentation_layer/screens/home/movie_carousel/movies_carousel.dart';
import 'package:movie_app/presentation_layer/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation_layer/screens/drawer/navigation_drawer.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_tab/movie_tab.dart';
import '../../widgets/app_load_error.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;
  MovieSearchBloc movieSearchBloc;

  @override
  void initState() {
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieSearchBloc = getItInstance<MovieSearchBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
    movieSearchBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
        BlocProvider(create: (context) => movieTabbedBloc),
        BlocProvider(create: (context) => movieSearchBloc)
      ],
      child: Scaffold(
          drawer: const NavigationDrawer(),
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
            bloc: movieCarouselBloc,
            builder: (context, state) {
              if (state is MovieCarouselLoaded) {
                return Scaffold(
                  body: Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.6,
                          child: MoviesCarousel(
                              movies: state.movies,
                              defaultIndex: state.defaultIndex)),
                      FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.4,
                          child: MovieTab()),
                    ],
                  ),
                );
              } else if (state is MovieCarouselError) {
                return AppLoadError(
                    errorType: state.errorType,
                    onTap: () => movieCarouselBloc.add(CarouselLoadEvent()));
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
