import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_event.dart';

import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_movies_recommendation_usecase.dart';
import 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent , MoviesDetailsState>{
  final GetMovieDetailsUseCase getMoviesDetailsUseCase;
  final BaseGetMoviesRecommendationUseCase getMoviesRecommendationUseCase;

  MoviesDetailsBloc(this.getMoviesDetailsUseCase, this.getMoviesRecommendationUseCase):super(const MoviesDetailsState()){
    /// getMoviesDetailsUseCase
    on<GetMoviesDetailsEvent>((event, emit) async {
      final result = await getMoviesDetailsUseCase(MovieDetailsParameters(movieId: event.id));
      result.fold((l) => emit(state.copyWith(moviesDetailsState: RequestState.error , moviesDetailsMessage: l.message )),
                  (r) => emit(state.copyWith(movieDetails: r , moviesDetailsState: RequestState.loaded, )) );
    });
    /// getMoviesRecommendationUseCase
    on<GetMoviesRecommendationEvent>((event, emit) async {
      final result = await getMoviesRecommendationUseCase(RecommendationParameters(id: event.id));
      result.fold((l) => emit(state.copyWith(recommendationState: RequestState.error , recommendationMessage: l.message )),
              (r) => emit(state.copyWith(recommendation: r , recommendationState: RequestState.loaded, )) );
    });

  }
}
