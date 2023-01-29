import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utilies/enums.dart';

import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMovieUseCase, this.getTopRatedMoviesUseCase) : super(MoviesState()){
    on<GetNowPLayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }


  FutureOr<void> _getNowPlayingMovies(GetNowPLayingMoviesEvent event, Emitter<MoviesState> emit) async{
    {
      final result=
          await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold((l) => emit(
          state.copyWith(
            nowPlayingState: RequestState.erorr,
            nowPlayingMessage: l.message,

          )
      ),
              (r) => emit(
              state.copyWith(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded,
              )
          ));
    }
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result=await getPopularMovieUseCase(const NoParameters());
    result.fold((l) => emit(
        state.copyWith(
          popularState: RequestState.erorr,
          popularMessage: l.message,
        )
    ),
          (r) => emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded,
          )
      ),
    );

  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result=await getTopRatedMoviesUseCase(const NoParameters());
    result.fold((l) => emit(
        state.copyWith(
      topRatedState: RequestState.erorr,
      topRatedMessage: l.message,
    )
    ),
         (r) => emit(
             state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        )
        ),
    );

  }
}