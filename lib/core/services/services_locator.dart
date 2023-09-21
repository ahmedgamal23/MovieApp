import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_movies_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';
import '../../movies/domain/usecase/get_popular_movies_usecase.dart';
import '../../movies/domain/usecase/get_top_rated_movies_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator{

  void init(){
    /// Bloc
    sl.registerLazySingleton(() => MoviesBloc(sl(), sl() , sl() ));
    sl.registerLazySingleton(() => MoviesDetailsBloc(sl() , sl()));
    //sl.registerFactory(() => MoviesBloc(sl() , sl() , sl()));
    /// UseCases
    sl.registerLazySingleton(() => GetMovieDetailsUseCase( sl()) );
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase( sl() ) );
    sl.registerLazySingleton(() => GetPopularMoviesUseCase( sl() ) );
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase( sl() ) );
    sl.registerLazySingleton(() => BaseGetMoviesRecommendationUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository( sl() ));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }

}
