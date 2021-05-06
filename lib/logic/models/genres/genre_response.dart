import 'package:flutter_movie_app/logic/models/genres/genre.dart';

class GenreResponse {
  List<Genre>? genres;

  GenreResponse({this.genres});

  GenreResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres!.add(new Genre.fromJson(v));
      });
    }
  }
}
