import 'package:dio/dio.dart';
import 'package:flutter_movie_app/constants/api_constants.dart';
import 'package:flutter_movie_app/logic/models/genres/genre_response.dart';

class GenresRepository {
  final Dio _dio = Dio();
  Future<GenreResponse> getGenresMovie() async {
    var params = {"api_key": ApiConstants.API_KEY, "language": "en-US"};
    String _url = ApiConstants.BASE_URL + "genre/movie/list";
    try {
      Response response = await _dio.get(_url, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
