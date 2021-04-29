import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/presentation_layer/blocs/movie_search/movie_search_bloc.dart';
import 'package:movie_app/presentation_layer/screens/movie_search/movie_search_card.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/widgets/app_load_error.dart';

class CustomSearchDelegate extends SearchDelegate {
  final MovieSearchBloc movieSearchBloc;

  CustomSearchDelegate(this.movieSearchBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: Theme.of(context).textTheme.greySubtitle1));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear_rounded,
            color: query.isEmpty ? Colors.grey : ColorsTheme.royalBlue,
          ),
          onPressed: query.isEmpty ? null : () => query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
        size: AppSizes.size_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    movieSearchBloc.add(SearchedMovieLoadEvent(query));

    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
        bloc: movieSearchBloc,
        builder: (context, state) {
          if (state is SearchedMovieError) {
            return AppLoadError(
              errorType: state.errorType,
              onTap: () => movieSearchBloc?.add(SearchedMovieLoadEvent(query)),
            );
          } else if (state is SearchedMovieLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size_64.w),
                  child: Text(
                    'No movies found !!',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) =>
                  MovieSearchCard(movie: movies[index]),
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
