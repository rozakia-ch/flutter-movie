import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/movies/movie_response.dart';
import 'package:flutter_movie_app/logic/repository/movies_repository.dart';

part 'movie_top_rated_state.dart';

class MovieTopRatedCubit extends Cubit<MovieTopRatedState> {
  MovieTopRatedCubit() : super(MovieTopRatedInitial());
  MoviesRepository _moviesRepository = MoviesRepository();

  void movieTopRated() async {
    emit(MovieTopRatedLoading());
    MovieResponse _result = await _moviesRepository.getMoviesTopRated();
    emit(MovieTopRatedLoaded(result: _result));
  }
}
