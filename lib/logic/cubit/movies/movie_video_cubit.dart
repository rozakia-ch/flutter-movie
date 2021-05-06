import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/movies/video/video_response.dart';
import 'package:flutter_movie_app/logic/repository/movies_repository.dart';

part 'movie_video_state.dart';

class MovieVideoCubit extends Cubit<MovieVideoState> {
  MovieVideoCubit() : super(MovieVideoInitial());
  MoviesRepository _moviesRepository = MoviesRepository();
  // movie_id integer required
  void video({int? id}) async {
    emit(MovieVideoLoading());
    VideoResponse _result = await _moviesRepository.getMovieVideos(id: id);
    emit(MovieVideoLoaded(result: _result));
  }
}
