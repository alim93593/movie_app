// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendation_use_case.dart';

import '../entities/recommendation.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>>getTopRatedMovies();
  Future<Either<Failure, MovieDetail>>getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List< Recommendation>>>getMovieRecommendation(RecommendationParameter parameter);
}