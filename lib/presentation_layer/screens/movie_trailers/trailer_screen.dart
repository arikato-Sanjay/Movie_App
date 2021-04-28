import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/domain_layer/entities/movie_trailer_entities.dart';
import 'package:movie_app/presentation_layer/screens/movie_trailers/trailer_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class TrailerScreen extends StatefulWidget {
  final TrailerArguments trailerArguments;

  const TrailerScreen({Key key, @required this.trailerArguments})
      : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  List<MovieTrailerEntities> trailers;
  YoutubePlayerController _controller;

  @override
  void initState() {
    trailers = widget.trailerArguments.trailers;
    _controller = YoutubePlayerController(
        initialVideoId: trailers[0].key,
        flags: YoutubePlayerFlags(autoPlay: true, mute: true));
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch trailers'),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < trailers.length; i++)
                        Container(
                          height: 60.h,
                          padding:
                              EdgeInsets.symmetric(vertical: AppSizes.size_8.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.load(trailers[i].key);
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: AppSizes.size_200.w,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: trailers[i].key,
                                      quality: ThumbnailQuality.high),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizes.size_8.w),
                                child: Text(
                                  trailers[i].title,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ))
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
