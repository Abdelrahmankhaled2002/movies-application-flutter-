import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendartionUseCase extends BaseUseCase<List<Recommendation> ,RecommendationParameters >{
  BaseMoviesRepository baseMoviesRepository;
  GetMovieRecommendartionUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Recommendation>>> call(RecommendationParameters parameters)async {
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable{
  final int movieId;
  const RecommendationParameters ({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}