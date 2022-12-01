import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List< Recommendation>,RecommendationParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List< Recommendation>>> call(RecommendationParameter parameters) async{
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }

}
class RecommendationParameter extends Equatable{
  const RecommendationParameter({required this.id});
  final int id;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}