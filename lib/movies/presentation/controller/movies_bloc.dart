import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';
import '../../../core/usecases/base_usecase.dart';
import '../../domain/usecase/get_popular_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent , MoviesState>{
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase , this.getPopularMoviesUseCase , this.getTopRatedMoviesUseCase):super(const MoviesState()) {
    /// NOW PLAYING EVENT
    on<GetNowPlayingMoviesEvent>((event, emit) async{
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold((l) => emit(state.copyWith(nowPlayingState: RequestState.error,nowPlayingMessage: l.message ,)) ,
                  (r) => emit(state.copyWith(nowPlayingMovies: r, nowPlayingState: RequestState.loaded,)) );
    });
    /// POPULAR EVENT
    on<GetPopularMoviesEvent>((event, emit) async{
      final result = await getPopularMoviesUseCase(const NoParameters());
      result.fold((l) => emit(state.copyWith(popularState: RequestState.error , popularMessage: l.message, )),
                  (r) => emit(state.copyWith(popularMovies: r , popularState: RequestState.loaded, )) );
    });
    /// TOP RATED EVENT
    on<GetTopRatedMoviesEvent>((event, emit) async{
      final result = await getTopRatedMoviesUseCase(const NoParameters());
      result.fold((l) => emit(state.copyWith(topRatedState: RequestState.error , topRatedMessage: l.message , )),
                  (r) => emit(state.copyWith(topRatedMovies: r , topRatedState: RequestState.loaded , )));
    });

  }

}
