import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

class MoviesDetailsState extends Equatable{
  final MovieDetails? movieDetails;
  final RequestState moviesDetailsState;
  final String moviesDetailsMessage;
  final List<Recommendations> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MoviesDetailsState( { this.movieDetails, this.moviesDetailsState=RequestState.loading, this.moviesDetailsMessage="" ,
                              this.recommendation=const [], this.recommendationState=RequestState.loading, this.recommendationMessage=""});

  MoviesDetailsState copyWith({
         MovieDetails? movieDetails,
         RequestState? moviesDetailsState,
         String? moviesDetailsMessage,
         List<Recommendations>? recommendation,
         RequestState? recommendationState,
         String? recommendationMessage,
      }){
    return MoviesDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage
    );
  }

  @override
  List<Object?> get props => [movieDetails , moviesDetailsState , moviesDetailsMessage , recommendation , recommendationState ,recommendationMessage ];
}
