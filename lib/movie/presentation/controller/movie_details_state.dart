part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetail,
      this.movieRequestState = RequestState.loading,
      this.movieDetailsmessage = '',
      this.recommendationRequestState = RequestState.loading,
      this.recommendation = const [],
      this.recommendationMessage = ''});

  final MovieDetail? movieDetail;
  final RequestState movieRequestState;
  final String movieDetailsmessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieRequestState,
    String? movieDetailsmessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsmessage: movieDetailsmessage ?? this.movieDetailsmessage,
      movieRequestState: movieRequestState ?? this.movieRequestState,
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage:recommendationMessage ?? this.recommendationMessage,
      recommendationRequestState: recommendationRequestState ?? this.recommendationRequestState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieDetail,
        movieRequestState,
        movieDetailsmessage,
        recommendation,
        recommendationRequestState,
        recommendationMessage,
      ];
}
