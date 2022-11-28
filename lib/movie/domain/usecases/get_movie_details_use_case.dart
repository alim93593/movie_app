import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/movie/domain/entities/movie_detail.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<List<MovieDetail>,MovieDetailsParameters>{
  final  BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieDetail>>> call(MovieDetailsParameters parameters)async {
    return await baseMoviesRepository.getMovieDetails();
  }
}
class MovieDetailsParameters extends Equatable{
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}