import 'package:flutter_movie_app/logic/models/movies/video/video.dart';

class VideoResponse {
  int? id;
  List<Video>? results;

  VideoResponse({this.id, this.results});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <Video>[];
      json['results'].forEach((v) {
        results!.add(new Video.fromJson(v));
      });
    }
  }
}
