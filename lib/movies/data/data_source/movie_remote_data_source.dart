import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';


abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRateMovies();
  Future<MovieDetailsModel>getMovieDetails(MovieDetailParameter parameters);
  Future<List<RecommendationModel>>getRecommendatioMovies(RecommendationParameters parameters);

}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>>getNowPlayingMovies()async{
    final response=await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) =>MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response=await Dio().get(ApiConstance.getPopularMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) =>MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRateMovies()async {
    final response=await Dio().get(ApiConstance.getTopRatedMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) =>MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailParameter parameters)async{
    final resonse=await Dio().get(ApiConstance.getMovieDetailsPath(parameters.id));
    if(resonse.statusCode==200){
      return MovieDetailsModel.fromJson(resonse.data);
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(resonse.data));
    }

  }
  @override
  Future<List<RecommendationModel>> getRecommendatioMovies(RecommendationParameters parameters) async{
    final resonse=await Dio().get(ApiConstance.getRecommendationMoviesPath(parameters.movieId));
    if(resonse.statusCode==200){
      return List<RecommendationModel>.from((resonse.data["results"]as List).map((e) => RecommendationModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(resonse.data));
    }
  }
}