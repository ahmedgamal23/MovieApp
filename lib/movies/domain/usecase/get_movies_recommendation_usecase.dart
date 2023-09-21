import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

import '../repository/base_movies_repository.dart';

class BaseGetMoviesRecommendationUseCase extends BaseUseCase<List<Recommendations> , RecommendationParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  BaseGetMoviesRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationParameters parameters) async{
    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable{
  final int id;
  const RecommendationParameters({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}