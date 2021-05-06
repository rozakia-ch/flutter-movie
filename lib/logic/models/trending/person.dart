import 'package:flutter_movie_app/logic/models/trending/known_for.dart';

class Person {
  String profilePath;
  int id;
  int gender;
  String knownForDepartment;
  bool adult;
  List<KnownFor> knownFor;
  String name;
  double popularity;
  String mediaType;

  Person(
      {this.profilePath,
      this.id,
      this.gender,
      this.knownForDepartment,
      this.adult,
      this.knownFor,
      this.name,
      this.popularity,
      this.mediaType});

  Person.fromJson(Map<String, dynamic> json) {
    profilePath = json['profile_path'];
    id = json['id'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    adult = json['adult'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor.add(new KnownFor.fromJson(v));
      });
    }
    name = json['name'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }
}
