import 'package:movie_app/movie/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path']??'/5ps2H3srzXZgmpI0yPv2xH6gc2W.jpg',
        id: json['id'],
      );
}
