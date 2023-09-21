import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie> , NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure , List<Movie> >> call(NoParameters parameters)async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}