import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailParameter>{
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure , MovieDetail>> call(MovieDetailParameter parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}
class MovieDetailParameter extends Equatable{
  final int id;

  const MovieDetailParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}
