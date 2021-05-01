import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/presentation_layer/movie_app.dart';
import 'package:movie_app/data_layer/tables/fav_movie_table.dart';
import 'dependency_injection/get_it.dart' as getIt;
import 'package:pedantic/pedantic.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  //this binds framework with flutter engine
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(FavMovieTableAdapter());

  unawaited(getIt.init());
  runApp(MovieApp());
}
