class Constant{
  static const String baseAPI = "https://api.themoviedb.org/3";
  static const String keyAPI = "c3435cfe40aeb079689227d82bf921d3";
  static const String nowPlayingMoviesPath = "$baseAPI/movie/now_playing?api_key=$keyAPI";
  static const String popularMoviesPath = "$baseAPI/movie/popular?api_key=$keyAPI";
  static const String topRatedMoviesPath = "$baseAPI/movie/top_rated?api_key=$keyAPI";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=>'$baseImageUrl$path';

  static String movieDetailsPath(int movieId){
    return "$baseAPI/movie/$movieId?api_key=$keyAPI";
  }

  static String recommendationPath(int movieId){
    return "$baseAPI/movie/$movieId/recommendations?api_key=$keyAPI";
  }

}
