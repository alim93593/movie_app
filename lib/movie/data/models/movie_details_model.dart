import 'package:movie_app/movie/data/models/genres_model.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.genres,
    super.backDropBath,
    required super.id,
    required super.overView,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        genres: List<GenresModel>.from(
          json['genres'].map((x)=>GenresModel.fromJson(x))
        ),
        backDropBath: json['backdrop_path'],
        id: json['id'],
        overView: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
