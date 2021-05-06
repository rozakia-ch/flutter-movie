import 'package:flutter_movie_app/logic/models/trending/person.dart';

class PersonResponse {
  int? page;
  List<Person>? results;
  int? totalPages;
  int? totalResults;

  PersonResponse({this.page, this.results, this.totalPages, this.totalResults});

  PersonResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Person>[];
      json['results'].forEach((v) {
        results!.add(new Person.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
