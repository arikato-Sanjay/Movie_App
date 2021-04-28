import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/screen_utils/screen_utils.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/domain_layer/entities/movie_detail_entities.dart';
import 'package:movie_app/common/extensions/num_extension.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

import 'movie_detail_appbar.dart';

class MoviePoster extends StatelessWidget {
  final MovieDetailEntities movie;

  const MoviePoster({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).primaryColor.withOpacity(0.3),
              Theme.of(context).primaryColor
            ])),
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.base_image_url}${movie.posterPath}',
          width: ScreenUtil.screenWidth,
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: ListTile(
          title: Text(
            movie.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            movie.releaseDate,
            style: Theme.of(context).textTheme.greySubtitle1,
          ),
          trailing: Text(
            movie.voteAverage.conversionToPercentage(),
            style: Theme.of(context).textTheme.violetHeadLine6,
          ),
        ),
      ),
      Positioned(
        left: AppSizes.size_16.w,
        right: AppSizes.size_16.w,
        top: ScreenUtil.statusBarHeight + AppSizes.size_4.h,
        child: MovieDetailAppBar(),
      )
    ]);
  }
}
