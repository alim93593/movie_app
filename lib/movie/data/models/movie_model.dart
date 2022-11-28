// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:movie_app/movie/domain/entities/movie.dart';

class MovieModel extends Movie{
  const MovieModel({
    required super.releaseDate,
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage
  });
   factory MovieModel.fromJson(Map<String,dynamic>json){
   return  MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['poster_path']??null,
      genreIds:List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble()
    );
  }


}