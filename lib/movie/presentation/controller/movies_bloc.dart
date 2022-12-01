// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movie/presentation/controller/movies_event.dart';
import 'package:movie_app/movie/presentation/controller/movies_state.dart';

import '../../domain/usecases/get_popular_movies_use_case.dart';
import '../../domain/usecases/get_top_rated_movies_use_case.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMovieUseCase;
  MoviesBloc(this.getNowPlayingUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMovieUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvents>(getNowPlayingMovies);
    on<GetPopularMoviesEvents>(getTopPopularMovies);
    on<GetTopRatedMoviesEvents>(getTopRatedMovies);
  }

  FutureOr<void> getNowPlayingMovies(
      GetNowPlayingMoviesEvents event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
      (r) => emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovies: r)),
    );
  }

  FutureOr<void> getTopPopularMovies(
      GetPopularMoviesEvents event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovieUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          topRatedState: RequestState.error, topRatedMessage: l.message)),
      (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded, topRatedMovies: r)),
    );
  }

  FutureOr<void> getTopRatedMovies(
      GetTopRatedMoviesEvents event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          popularState: RequestState.error, popularMessage: l.message)),
      (r) => emit(
          state.copyWith(popularState: RequestState.loaded, popularMovies: r)),
    );
  }
}
