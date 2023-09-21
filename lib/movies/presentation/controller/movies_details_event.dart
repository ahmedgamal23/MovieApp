import 'package:equatable/equatable.dart';

abstract class MoviesDetailsEvent extends Equatable{
  const MoviesDetailsEvent();
}

class GetMoviesDetailsEvent extends MoviesDetailsEvent{
  final int id;
  const GetMoviesDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMoviesRecommendationEvent extends MoviesDetailsEvent{
  final int id;
  const GetMoviesRecommendationEvent(this.id);

  @override
  List<Object?> get props => [id];
}

