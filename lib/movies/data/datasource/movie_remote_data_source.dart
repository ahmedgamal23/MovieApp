import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/movies/data/model/movie_details_model.dart';
import 'package:movies_app/movies/data/model/movie_model.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/model/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_movies_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters movieDetailsParameters);
  Future<List<RecommendationModel>> getRecommendations(RecommendationParameters recommendationParameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
    final response = await Dio().get(Constant.nowPlayingMoviesPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from( (response.data["results"] as List).map((e) => MovieModel.fromJson(e) ) );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(Constant.popularMoviesPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from( (response.data["results"] as List).map((e) => MovieModel.fromJson(e) ) );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data) );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(Constant.topRatedMoviesPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from( (response.data["results"] as List).map((e) => MovieModel.fromJson(e) ) );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data) );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters movieDetailsParameters) async {
    final response = await Dio().get(Constant.movieDetailsPath(movieDetailsParameters.movieId));
    if(response.statusCode==200) {
      return  MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data) );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(RecommendationParameters recommendationParameters) async{
    final response = await Dio().get(Constant.recommendationPath(recommendationParameters.id));
    if(response.statusCode == 200){
      return List<RecommendationModel>.from( (response.data["results"] as List).map((e) => RecommendationModel.fromJson(e) ) );
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}
