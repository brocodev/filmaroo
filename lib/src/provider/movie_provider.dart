import 'dart:convert';

import 'package:filmaroo/src/models/genres.dart';
import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/models/movie_cast.dart';
import 'package:filmaroo/src/models/movies_summary.dart';
import 'package:http/http.dart' as http;

class MovieProvider {

  //Para obtener tu api Key es necesario que te registres en The MovieDB
  //https://developers.themoviedb.org/3/getting-started/introduction
  static final _apiKey = ""; //<-- Aqui coloca tu apiKey

  static final _baseUrl = "api.themoviedb.org";
  static final _language = "es-ES";
  static final _versionApi = 3;

  static List<Genre> genresMovie;

  static Future<List<Movie>> getNowPlaying() async {
    final nowPlayingPath = "$_versionApi/movie/now_playing";
    final parameters = {
      "api_key": _apiKey,
      "language": _language,

    };
    final url = Uri.https(_baseUrl, nowPlayingPath, parameters);
    final response = await http.get(url);
    final movieSummary = movieSummaryFromJson(response.body);

    if(genresMovie == null){
      final genresPath = "$_versionApi/genre/movie/list";
      final urlGenres = Uri.https(_baseUrl, genresPath, parameters);
      final responseGenres = await http.get(urlGenres);
      genresMovie = genresFromJson(responseGenres.body).genres;
    }
    return movieSummary.results;
  }

  static Future<List<Movie>> getPopular() async {
    final popularPath = "$_versionApi/movie/popular";
    final parameters = {
      "api_key": _apiKey,
      "language": _language,
    };
    final url = Uri.https(_baseUrl, popularPath, parameters);
    final response = await http.get(url);
    final res = json.decode(response.body);
    final list =
        List<Movie>.from(res["results"].map((movie) => Movie.fromJson(movie)));
    return list;
  }

  static Future<List<Cast>> getMovieCast(int movieId) async {
    final movieCastPath = "$_versionApi/movie/$movieId/credits";
    final parameters = {
      "api_key": _apiKey,
      "language": _language,
    };
    final url = Uri.https(_baseUrl, movieCastPath, parameters);
    final response = await http.get(url);
    final movieCast = movieCastFromJson(response.body);
    return movieCast.cast;
  }


  static Future<List<Movie>> searchMovie(String query) async {
    final popularPath = "$_versionApi/search/movie";
    final parameters = {
      "api_key": _apiKey,
      "language": _language,
      "query":query,
    };
    final url = Uri.https(_baseUrl, popularPath, parameters);
    final response = await http.get(url);
    final res = json.decode(response.body);
    final list =
    List<Movie>.from(res["results"].map((movie) => Movie.fromJson(movie)));
    return list;
  }
}
