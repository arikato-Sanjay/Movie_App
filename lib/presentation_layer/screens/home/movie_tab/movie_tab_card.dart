import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/common/extensions/string_extension.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_detail_arguments.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_details_screen.dart';

class MovieTabCard extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCard(
      {Key key,
      @required this.movieId,
      @required this.title,
      @required this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
                movieDetailsArguments: MovieDetailsArguments(movieId))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.size_16.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.base_image_url}$posterPath',
                  fit: BoxFit.cover,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.size_4.h),
            child: Text(
              title.stringTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
