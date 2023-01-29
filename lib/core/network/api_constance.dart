class ApiConstance{
  //api:https://api.themoviedb.org/3/movie/now_playing?api_key=71d3d5f01991fb5674801a1cb96f0169
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="71d3d5f01991fb5674801a1cb96f0169";

  static const String nowPlayingMoviesPath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getPopularMoviesPath="$baseUrl/movie/popular?api_key=$apiKey";
  static const String getTopRatedMoviesPath="$baseUrl/movie/top_rated?api_key=$apiKey";

  static  String getMovieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String getRecommendationMoviesPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static String imaggeUrl(String path )=>'$baseImageUrl$path';

}