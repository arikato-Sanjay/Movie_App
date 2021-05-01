import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/presentation_layer/blocs/movie_fav/movie_fav_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntities movieDetailEntities;

  const MovieDetailAppBar({Key key, @required this.movieDetailEntities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: AppSizes.size_12.h,
          ),
        ),
        BlocBuilder<MovieFavBloc, MovieFavState>(
          builder: (context, state) {
            if (state is FavMovieCheck) {
              return GestureDetector(
                onTap: () => BlocProvider.of<MovieFavBloc>(context).add(
                    FavMovieToggleEvent(
                        MoviesEntities.fromMovieDetailEntities(
                            movieDetailEntities),
                        state.checkFav)),
                child: Icon(
                  state.checkFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: AppSizes.size_12.h,
                ),
              );
            }
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: AppSizes.size_12.h,
            );
          },
        )
      ],
    );
  }
}
