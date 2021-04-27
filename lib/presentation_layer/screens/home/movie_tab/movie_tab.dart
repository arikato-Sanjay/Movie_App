import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/string_constants.dart';
import 'package:movie_app/presentation_layer/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_tab/movie_tab_list.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_tab/tab_constants.dart';
import 'package:movie_app/presentation_layer/screens/home/movie_tab/tab_title.dart';
import 'package:movie_app/presentation_layer/widgets/app_load_error.dart';

class MovieTab extends StatefulWidget {
  @override
  _MovieTabState createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabBloc => BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    movieTabBloc.add(MovieTabbedChangeEvent(currentTabIndex: currentTabIndex));
    super.initState();
  }

  @override
  void dispose() {
    movieTabBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
        builder: (context, state) {
      return Padding(
          padding: EdgeInsets.only(top: AppSizes.size_4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < TabConstants.movieTabs.length; i++)
                    TabTitle(
                        title: TabConstants.movieTabs[i].title,
                        onTap: () => _onTabTapped(i),
                        isSelected: TabConstants.movieTabs[i].index ==
                            state.currentTabIndex)
                ],
              ),
              if (state is MovieTabbedChanged)
                state.movies?.isEmpty ?? true
                    ? Expanded(
                        child: Center(
                        child: Text(
                          StringConstants().sorry,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ))
                    : Expanded(
                        child: MovieTabList(
                          movies: state.movies,
                        ),
                      ),
              if (state is MovieTabbedError)
                Expanded(
                    child: AppLoadError(
                        errorType: state.errorType,
                        onTap: () => movieTabBloc.add(MovieTabbedChangeEvent(
                            currentTabIndex: currentTabIndex))))
            ],
          ));
    });
  }

  void _onTabTapped(int index) {
    movieTabBloc.add(MovieTabbedChangeEvent(currentTabIndex: index));
  }
}
