import 'package:dio/dio.dart';
import 'package:flutter_movie_app/constants/api_constants.dart';
import 'package:flutter_movie_app/logic/models/discover/discover_response.dart';

class DiscoverRepository {
  final Dio _dio = Dio();

  /// * String [withGenres] Comma separated value of genre ids that you want to include in the results.
  Future<DiscoverResponse> getDiscoverMovie({int withGenres}) async {
    var _params = {
      "api_key": ApiConstants.API_KEY,
      "language": "en-US",
      "page": 1,
      "with_genres": withGenres,
    };
    String _url = ApiConstants.BASE_URL + "discover/movie";
    try {
      Response response = await _dio.get(_url, queryParameters: _params);
      return DiscoverResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
