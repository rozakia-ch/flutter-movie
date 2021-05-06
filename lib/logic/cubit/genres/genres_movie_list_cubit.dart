import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/genres/genre_response.dart';
import 'package:flutter_movie_app/logic/repository/genres_repository.dart';

part 'genres_movie_list_state.dart';

class GenresMovieListCubit extends Cubit<GenresMovieListState> {
  GenresMovieListCubit() : super(GenresMovieListInitial());
  GenresRepository _genresRepository = GenresRepository();

  void genresMovie() async {
    emit(GenresMovieListLoading());
    GenreResponse _result = await _genresRepository.getGenresMovie();
    emit(GenresMovieListLoaded(result: _result));
  }
}
