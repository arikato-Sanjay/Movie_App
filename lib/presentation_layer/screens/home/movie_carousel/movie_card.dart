import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

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
        onTap: () {},
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
