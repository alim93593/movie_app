import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase <List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository ;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters)async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}