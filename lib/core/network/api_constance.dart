class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="4aee1a39855b5e0eb5542515c657abaf";
  static const String nowPlayingMoviesPath ="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath ="$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath ="$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static  String imageUrl(String path)=>'$baseImageUrl$path';
}