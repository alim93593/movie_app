import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super((const MovieDetailsState())) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieRequestState: RequestState.error,
            movieDetailsmessage: l.message)),
        (r) => emit(
              state.copyWith(
                  movieRequestState: RequestState.loaded, movieDetail: r),
            ));
  }
 final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    final result =
    await getRecommendationUseCase(RecommendationParameter(id: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            recommendationRequestState: RequestState.error,
            recommendationMessage: l.message)),
            (r) => emit(
          state.copyWith(
              recommendationRequestState: RequestState.loaded, recommendation: r),
        ));
  }
}
