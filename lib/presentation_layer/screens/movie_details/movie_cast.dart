import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/data_layer/core/api_constants.dart';
import 'package:movie_app/presentation_layer/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';

class MovieCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
        builder: (context, state) {
      if (state is MovieCastLoaded)
        return Container(
          height: AppSizes.size_100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.movieCast.length,
            itemBuilder: (context, index) {
              final cast = state.movieCast[index];
              return Container(
                height: AppSizes.size_100.h,
                width: AppSizes.size_150.w,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.size_8.w,
                      vertical: AppSizes.size_4.w),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSizes.size_8.w)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8.w)),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${ApiConstants.base_image_url}${cast.posterPath}',
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSizes.size_8.w),
                        child: Text(
                          cast.name,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.vulcanBodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppSizes.size_8.w,
                            right: AppSizes.size_8.w,
                            bottom: AppSizes.size_2.h),
                        child: Text(
                          cast.characterPlayed,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      else
        return const SizedBox.shrink();
    });
  }
}
