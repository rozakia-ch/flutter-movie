import 'package:flutter_movie_app/logic/models/movies/movie.dart';

class DiscoverResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  DiscoverResponse({this.page, this.results, this.totalPages, this.totalResults});

  DiscoverResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
