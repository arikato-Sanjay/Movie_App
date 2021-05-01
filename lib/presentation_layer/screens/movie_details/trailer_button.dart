import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/routes_list.dart';
import 'package:movie_app/presentation_layer/blocs/movie_trailer/movie_trailer_bloc.dart';
import 'package:movie_app/presentation_layer/screens/movie_trailers/trailer_arguments.dart';
import 'package:movie_app/presentation_layer/widgets/app_buttons.dart';

class TrailerButton extends StatelessWidget {
  final MovieTrailerBloc movieTrailerBloc;

  const TrailerButton({Key key, this.movieTrailerBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: movieTrailerBloc,
        builder: (context, state) {
          if (state is MovieTrailerLoaded &&
              state.trailers.iterator.moveNext()) {
            final _trailers = state.trailers;
            return AppButtons(
              title: 'Watch Trailers',
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesList.movieTrailer, arguments: MovieTrailerArguments(_trailers));
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
