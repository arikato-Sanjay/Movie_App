import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/routes_list.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/domain_layer/entities/movies_entities.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_detail_arguments.dart';
import 'package:movie_app/presentation_layer/screens/movie_details/movie_details_screen.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';

class MovieSearchCard extends StatelessWidget {
  final MoviesEntities movie;

  const MovieSearchCard({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(RoutesList.movieDetail,
          arguments: MovieDetailsArguments(movie.id)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.size_16.w, vertical: AppSizes.size_2.h),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.all(AppSizes.size_8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.size_8.w),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.base_image_url}${movie.posterPath}',
                    width: AppSizes.size_80.w,
                  ),
                )),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
