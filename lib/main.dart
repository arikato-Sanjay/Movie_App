import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/presentation_layer/movie_app.dart';
import 'dependency_injection/get_it.dart' as getIt;
import 'package:pedantic/pedantic.dart';

Future<void> main() async {
  //this binds framework with flutter engine
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MovieApp());
}
