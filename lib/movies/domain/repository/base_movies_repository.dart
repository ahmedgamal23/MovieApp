import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import '../../../core/error/failure.dart';
import '../usecase/get_movie_details_usecase.dart';
import '../usecase/get_movies_recommendation_usecase.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure , List<Movie> >> getNowPlayingMovies();
  Future<Either<Failure , List<Movie> >> getPopularMovies();
  Future<Either<Failure , List<Movie> >> getTopRatedMovies();
  Future<Either<Failure , MovieDetails >> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure , List<Recommendations> >> getMovieRecommendation(RecommendationParameters parameters);
}
