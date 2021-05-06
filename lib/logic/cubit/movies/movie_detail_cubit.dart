import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/movies/movie_detail/movie_detail_response.dart';
import 'package:flutter_movie_app/logic/repository/movies_repository.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());
  MoviesRepository _moviesRepository = MoviesRepository();

  /// movie_id integer required
  void movieDetail({int id}) async {
    emit(MovieDetailLoading());
    MovieDetailResponse _result = await _moviesRepository.getMovieDetail(id: id);
    emit(MovieDetailLoaded(result: _result));
  }
}
