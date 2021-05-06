import 'package:flutter_movie_app/logic/models/movies/movie.dart';
import 'package:flutter_movie_app/logic/models/movies/now_playing/dates.dart';

class NowPlayingResponse {
  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  NowPlayingResponse({this.dates, this.page, this.results, this.totalPages, this.totalResults});

  NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
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
