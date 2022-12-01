import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entities/geners.dart';

class MovieDetail extends Equatable {
  final String? backDropBath;
  final List<Genres> genres;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.genres,
    required this.backDropBath,
    required this.id,
    required this.overView,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backDropBath,
        id,
        overView,
        releaseDate,
        runTime,
        title,
        voteAverage,
        genres,
      ];
}
