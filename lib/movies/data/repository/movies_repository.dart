import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure , List<Movie> >> getNowPlayingMovies()async {
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailuer(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure , List<Movie> >> getPopularMovies() async{
    final result= await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailuer(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure , List<Movie> >> getTopRatedMovies()async
  {
    final result= await baseMovieRemoteDataSource.getTopRateMovies();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailuer(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameter parameters)async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailuer(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(RecommendationParameters parameters)async {
    final result = await baseMovieRemoteDataSource.getRecommendatioMovies(parameters);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailuer(failure.errorMessageModel.statusMessage));
    }
  }



  }






