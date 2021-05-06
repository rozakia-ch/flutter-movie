import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/movies/now_playing/now_playing_response.dart';
import 'package:flutter_movie_app/logic/repository/movies_repository.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());
  MoviesRepository _moviesRepository = MoviesRepository();

  void nowPlaying() async {
    emit(NowPlayingLoading());
    NowPlayingResponse _result = await _moviesRepository.getMoviesNowPlaying();
    emit(NowPlayingLoaded(result: _result));
  }
}
