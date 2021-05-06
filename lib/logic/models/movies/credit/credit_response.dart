import 'package:flutter_movie_app/logic/models/movies/credit/cast.dart';
import 'package:flutter_movie_app/logic/models/movies/credit/crew.dart';

class CreditResponse {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  CreditResponse({this.id, this.cast, this.crew});

  CreditResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew.add(new Crew.fromJson(v));
      });
    }
  }
}
