import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/movies/movie_response.dart';
import 'package:flutter_movie_app/logic/repository/movies_repository.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesInitial());
  MoviesRepository _moviesRepository = MoviesRepository();

  /// movie_id integer required
  void similarMovies({int id}) async {
    emit(SimilarMoviesLoading());
    MovieResponse _result = await _moviesRepository.getSimilarMovies(id: id);
    emit(SimilarMoviesLoaded(result: _result));
  }
}
