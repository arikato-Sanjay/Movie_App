import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_detail_arguments.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_details_screen.dart';

class MoviesCard extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MoviesCard({Key key, this.movieId, this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(AppSizes.size_16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                  movieDetailsArguments: MovieDetailsArguments(movieId))));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.size_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.base_image_url}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
