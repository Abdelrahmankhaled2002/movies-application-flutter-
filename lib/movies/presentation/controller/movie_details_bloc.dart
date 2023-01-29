import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utilies/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getmovieDetailsUseCase,this.getMovieRecommendartionUseCase) :
        super(const MovieDetailsState(recommendation: [])) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);

  }
  final GetMovieDetailsUseCase getmovieDetailsUseCase;
  final GetMovieRecommendartionUseCase getMovieRecommendartionUseCase;


  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async {
    final result=await getmovieDetailsUseCase(MovieDetailParameter(id: event.id));
    result.fold((l) => emit(
        state.copyWith(
            movieDetailsSate:RequestState.erorr,
            message: l.message)
    ),
            (r) => emit(
                state.copyWith(
                    movieDetail: r,
                    movieDetailsSate: RequestState.loaded
                )));
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)
  async
  {
    final result=await getMovieRecommendartionUseCase(RecommendationParameters(movieId: event.id));
    result.fold((l) => emit(
      state.copyWith(
        recommendationState: RequestState.erorr,
        recommendationMessage: l.message
      )
    ), (r) => emit(
     state.copyWith(
       recommendation: r,
       recommendationState: RequestState.loaded
     )
    ));

  }
}
