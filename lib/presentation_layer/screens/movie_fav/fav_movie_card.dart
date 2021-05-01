import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/routes_list.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/blocs/movie_fav/movie_fav_bloc.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_detail_arguments.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_details_screen.dart';

class FavMovieCard extends StatelessWidget {
  final MoviesEntities movie;

  const FavMovieCard({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: AppSizes.size_8.h),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.size_8.w)),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(RoutesList.movieDetail, arguments: MovieDetailsArguments(movie.id)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.size_12.w),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: '${ApiConstants.base_image_url}${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: AppSizes.size_100.h,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<MovieFavBloc>(context)
                          .add(FavMovieDeleteEvent(movie.id));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.size_12.w),
                      child: Icon(
                        Icons.delete,
                        size: AppSizes.size_12.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
