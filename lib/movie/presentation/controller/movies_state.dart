import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;
  const MoviesState(
      {this.popularMessage = '',
      this.topRatedMessage = '',
      this.topRatedMovies = const [],
      this.topRatedState = RequestState.loading,
      this.popularState = RequestState.loading,
      this.popularMovies = const [],
      this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = ''});

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularState,
        popularMovies,
        popularMessage,
        topRatedMessage,
        topRatedMovies,
        topRatedState
      ];
}
