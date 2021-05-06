import 'package:dio/dio.dart';
import 'package:flutter_movie_app/constants/api_constants.dart';
import 'package:flutter_movie_app/logic/models/movies/credit/credit_response.dart';
import 'package:flutter_movie_app/logic/models/movies/movie_detail/movie_detail_response.dart';
import 'package:flutter_movie_app/logic/models/movies/movie_response.dart';
import 'package:flutter_movie_app/logic/models/movies/now_playing/now_playing_response.dart';
import 'package:flutter_movie_app/logic/models/movies/video/video_response.dart';

class MoviesRepository {
  final Dio _dio = Dio();
  Future<MovieResponse> getMoviesTopRated() async {
    var _params = {"api_key": ApiConstants.API_KEY, "language": "en-US", "page": 1};
    String _url = ApiConstants.BASE_URL + "movie/top_rated";
    try {
      Response _response = await _dio.get(_url, queryParameters: _params);
      return MovieResponse.fromJson(_response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<NowPlayingResponse> getMoviesNowPlaying() async {
    var _params = {"api_key": ApiConstants.API_KEY, "language": "en-US", "page": 1};
    String _url = ApiConstants.BASE_URL + "movie/now_playing";
    try {
      Response _response = await _dio.get(_url, queryParameters: _params);
      return NowPlayingResponse.fromJson(_response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  /// movie_id integer required
  Future<MovieDetailResponse> getMovieDetail({int id}) async {
    var _params = {"api_key": ApiConstants.API_KEY, "language": "en-US"};
    String _url = ApiConstants.BASE_URL + "movie/$id";
    try {
      Response _response = await _dio.get(_url, queryParameters: _params);
      return MovieDetailResponse.fromJson(_response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  /// movie_id integer required
  Future<VideoResponse> getMovieVideos({int id}) async {
    var _params = {"api_key": ApiConstants.API_KEY, "language": "en-US"};
    String _url = ApiConstants.BASE_URL + "movie/$id/videos";
    try {
      Response _response = await _dio.get(_url, queryParameters: _params);
      return VideoResponse.fromJson(_response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  /// movie_id integer required
  Future<MovieResponse> getSimilarMovies({int id}) async {
    var _params = {"api_key": ApiConstants.API_KEY, "language": "en-US"};
    String _url = ApiConstants.BASE_URL + "movie/$id/similar";
    try {
      Response _response = await _dio.get(_url, queryParameters: _params);
      return MovieResponse.fromJson(_response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  /// movie_id integer required
  Future<CreditResponse> getCredit({int id}) async {
    var _params = {"api_key": ApiConstants.API_KEY, "language": "en-US"};
    String _url = ApiConstants.BASE_URL + "movie/$id/credits";
    try {
      Response response = await _dio.get(_url, queryParameters: _params);
      return CreditResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
