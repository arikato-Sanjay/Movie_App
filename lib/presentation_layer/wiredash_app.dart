import 'package:flutter/material.dart';
import 'package:movie_app/presentation_layer/themes/colors_theme.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;

  const WireDashApp(
      {Key key, @required this.navigatorKey, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-8spy6at',
      secret: 't82t5rc1b7el2sbdeokbripnab5pzt0ebj6uqntmfwv48y7w',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
        showDebugFloatingEntryPoint: false,
      ),
      theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: ColorsTheme.royalBlue,
          secondaryColor: ColorsTheme.violet,
          secondaryBackgroundColor: ColorsTheme.vulcan,
          dividerColor: ColorsTheme.vulcan),
    );
  }
}
