part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {
   const MovieDetailsState({
     this.movieDetail,
     this.movieDetailsSate=RequestState.loading,
     this.moviDetailsMessage='',
     required this.recommendation,
     this.recommendationState=RequestState.loading,
     this.recommendationMessage='',
   });

   final MovieDetail? movieDetail;
  final RequestState movieDetailsSate;
  final String moviDetailsMessage;

   final List<Recommendation>recommendation;
   final RequestState recommendationState;
   final String recommendationMessage;

  MovieDetailsState copyWith({
     MovieDetail? movieDetail,
     RequestState? movieDetailsSate,
     String? message,
     List<Recommendation>?recommendation,
     RequestState? recommendationState,
     String? recommendationMessage,
 }){
    return MovieDetailsState(
      movieDetail: movieDetail??this.movieDetail,
      movieDetailsSate: movieDetailsSate??this.movieDetailsSate,
      moviDetailsMessage: message??this.moviDetailsMessage,
      recommendation: recommendation??this.recommendation,
      recommendationState: recommendationState??this.recommendationState,
      recommendationMessage: recommendationMessage??this.recommendationMessage,
    );
}


  @override
  // TODO: implement props
  List<Object?> get props => [movieDetail,movieDetailsSate,moviDetailsMessage,recommendation,recommendationState,recommendationMessage];
}
