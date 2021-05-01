import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/routes_list.dart';
import 'package:movie_app/common/screen_utils/screen_utils.dart';
import 'package:movie_app/presentation_layer/routes.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:movie_app/presentation_layer/themes/text_theme.dart';
import 'package:movie_app/presentation_layer/wiredash_app.dart';
import 'package:movie_app/presentation_layer/fade_page_route_builder.dart';

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
          builder: (context, child) {
            return child;
          },
          initialRoute: RoutesList.initial,
          onGenerateRoute: (RouteSettings settings) {
            final routes = Routes.getRoutes(settings);
            final WidgetBuilder builder = routes[settings.name];
            return FadePageRouteBuilder(builder: builder, settings: settings);
          },
        ));
  }
}
