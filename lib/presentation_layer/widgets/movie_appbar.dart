import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/screen_utils/screen_utils.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/blocs/movie_search/movie_search_bloc.dart';
import 'package:movie_app/presentation_layer/screens/movie_search/custom_search_delegate.dart';
import 'package:movie_app/presentation_layer/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + AppSizes.size_4.h,
          left: AppSizes.size_16.w,
          right: AppSizes.size_16.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: AppSizes.size_12.h,
            ),
          ),
          Expanded(
              child: const Logo(
            height: AppSizes.size_14,
          )),
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    BlocProvider.of<MovieSearchBloc>(context),
                  ),
                );
              },
              icon: Icon(Icons.search,
                  color: Colors.white, size: AppSizes.size_20))
        ],
      ),
    );
  }
}
