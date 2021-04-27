import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data_layer/core/api_client.dart';
import 'package:movie_app/data_layer/data_source/movies_remote_data.dart';
import 'package:movie_app/data_layer/repositories/movies_repositories_imple.dart';
import 'package:movie_app/domain_layer/repositories/movies_repositories.dart';
import 'package:movie_app/domain_layer/usecases/get_playing_now.dart';
import 'package:movie_app/domain_layer/usecases/get_popular.dart';
import 'package:movie_app/domain_layer/usecases/get_trending.dart';
import 'package:movie_app/domain_layer/usecases/get_upcoming.dart';
import 'package:movie_app/presentation_layer/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation_layer/blocs/movie_tabbed/movie_tabbed_bloc.dart';

//static instance of get_it
final getItInstance = GetIt.I;

//all dependencies goes in this function
Future init() async {
  //getIt initializing/instance client for us
  getItInstance.registerLazySingleton<Client>(() => Client());

  //since apiClient and movie remote data is used throughout the app,
  //hence registering singleton

  //ApiClient depends on client
  //getIt providing client to apiClient instance
  //getItInstance() giving client instance to APIClient
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //MovieRemoteData depends on ApiClient
  getItInstance.registerLazySingleton<MoviesRemoteData>(
      () => MoviesRemoteDataImplementation(getItInstance()));

  //all use cases are dependent on movie repository
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance
      .registerLazySingleton<GetUpComing>(() => GetUpComing(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<MoviesRepositories>(
      () => MoviesRepositoriesImplementation(getItInstance()));

  //di for bloc
  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieTabbedBloc(
      getPopular: GetPopular(getItInstance()),
      getPlayingNow: GetPlayingNow(getItInstance()),
      getUpComing: GetUpComing(getItInstance())));
}
