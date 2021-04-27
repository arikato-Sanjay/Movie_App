import 'package:flutter/material.dart';
import 'package:movie_app/common/screen_utils/screen_utils.dart';
import 'package:movie_app/presentation_layer/screens/home/home_screen.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';
import 'package:movie_app/presentation_layer/wiredash_app.dart';

class MovieApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return WireDashApp(
        navigatorKey: _navigatorKey,
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
              primaryColor: ColorsTheme.vulcan,
              accentColor: ColorsTheme.royalBlue,
              scaffoldBackgroundColor: ColorsTheme.vulcan,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextsTheme.getTextTheme(),
              appBarTheme: const AppBarTheme(elevation: 0)),
          home: HomeScreen(),
        ));
  }
}
