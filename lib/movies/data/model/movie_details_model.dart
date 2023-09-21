import 'package:movies_app/movies/data/model/geners_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel({required super.backdropPath, required super.geners, required super.id, required super.overview,
                           required super.releaseDate, required super.runtime, required super.title, required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String , dynamic> json){
    return MovieDetailsModel(backdropPath: json['backdrop_path'],
                            geners: List<GenersModel>.from(json["genres"].map((e) => GenersModel.fromJson(e))),
                            id: json['id'],
                            overview: json["overview"],
                            releaseDate: json["release_date"],
                            runtime: json["runtime"],
                            title: json["title"],
                            voteAverage: json["vote_average"].toDouble() );

  }

}