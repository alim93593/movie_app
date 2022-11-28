import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/datasource/movie_remote_datasource.dart';
import 'package:movie_app/movie/data/repository/movies_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movie/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    //// UseCases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    //// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    //// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
