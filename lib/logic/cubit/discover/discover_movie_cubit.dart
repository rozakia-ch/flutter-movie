import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/discover/discover_response.dart';
import 'package:flutter_movie_app/logic/repository/discover_repository.dart';

part 'discover_movie_state.dart';

class DiscoverMovieCubit extends Cubit<DiscoverMovieState> {
  DiscoverMovieCubit() : super(DiscoverMovieInitial());
  DiscoverRepository _discoverRepository = DiscoverRepository();

  /// * String [withGenres] Comma separated value of genre ids that you want to include in the results.
  void getDiscoverMovie({int? id}) async {
    emit(DiscoverMovieLoading());
    final DiscoverResponse _result = await _discoverRepository.getDiscoverMovie(withGenres: id);
    emit(DiscoverMovieLoaded(result: _result));
  }
}
