import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail{
  const MovieDetailsModel({required String backDropPath,
    required int id,
    required String overView,
    required String releaseDate,
    required int runTime,
    required String title,
    required double voteAverage,
    required List<Genres> genres})
      : super(backdropPath: backDropPath,
      id: id, overview: overView,
      releaseDate: releaseDate,
      runtime: runTime,
      title: title,
      voteAverage: voteAverage,
      genres: genres);
  factory MovieDetailsModel.fromJson(Map<String,dynamic>json)=>MovieDetailsModel(
      backDropPath: json["backdrop_path"],
      id:json["id"] ,
      overView: json["overview"],
      releaseDate: json["release_date"],
      runTime: json["runtime"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble(),
      genres: List<GenresModel>.from(json["genres"].map((x)=>GenresModel.fromJson(x))),
  );



}