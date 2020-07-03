
import 'dart:convert';
import 'package:filmaroo/src/models/dates.dart';
import 'package:filmaroo/src/models/movie.dart';

MoviesSummary movieSummaryFromJson(String str) => MoviesSummary.fromJson(json.decode(str));
String movieSummaryToJson(MoviesSummary data) => json.encode(data.toJson());

class MoviesSummary {
  MoviesSummary({
    this.results,
    this.page,
    this.totalMovies,
    this.dates,
    this.totalPages,
  });

  List<Movie> results;
  int page;
  int totalMovies;
  Dates dates;
  int totalPages;

  factory MoviesSummary.fromJson(Map<String, dynamic> json) {
    return MoviesSummary(
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    page: json["page"],
    totalMovies: json["total_results"],
    dates: Dates.fromJson(json["dates"]),
    totalPages: json["total_pages"],
  );
  }

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "page": page,
    "total_results": totalMovies,
    "dates": dates.toJson(),
    "total_pages": totalPages,
  };
}


