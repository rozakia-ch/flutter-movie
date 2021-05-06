import 'package:dio/dio.dart';
import 'package:flutter_movie_app/constants/api_constants.dart';
import 'package:flutter_movie_app/logic/models/trending/person_response.dart';

class TrendingRepository {
  final Dio _dio = Dio();

  /// Media Type	Description
  /// * [all]	- Include all movies, TV shows and people in the results as a global trending list.
  /// * [movie]	- Show the trending movies in the results.
  /// * [tv]	- Show the trending TV shows in the results.
  /// * [person]	- Show the trending people in the results.
  ///
  /// Time Window	Description
  /// * [day]	- View the trending list for the day.
  /// * [week] -	View the trending list for the week.
  Future<PersonResponse> getTrending({
    String mediaType = "all",
    String timeWindow = "week",
  }) async {
    var params = {"api_key": ApiConstants.API_KEY};
    String _url = ApiConstants.BASE_URL + "trending/person/week";
    try {
      Response response = await _dio.get(_url, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
