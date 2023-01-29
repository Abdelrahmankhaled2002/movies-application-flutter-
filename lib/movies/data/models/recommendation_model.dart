import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
  const RecommendationModel({
     String ?backdropPath
    , required int id})
      : super(
      backdropPath: backdropPath,
      id: id
  );
  factory RecommendationModel.fromJson(Map<String,dynamic>json)=>
      RecommendationModel(
          id: json["id"],
          backdropPath: json["backdrop_path"] ??'/y5Z0WesTjvn59jP6yo459eUsbli.jpg'
      );

}