
import 'package:movies_app/movies/domain/entities/genres.dart';

class GenresModel extends Genres{
  const GenresModel({required String name,
      required int id})
      : super(name: name,
      id: id);
  factory GenresModel.fromJson(Map<String,dynamic>json)=>GenresModel(
      id: json["id"],
      name:json["name"] ,
      );
  
}