import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/movies/credit/credit_response.dart';
import 'package:flutter_movie_app/logic/repository/movies_repository.dart';

part 'movie_credit_state.dart';

class MovieCreditCubit extends Cubit<MovieCreditState> {
  MovieCreditCubit() : super(MovieCreditInitial());
  MoviesRepository _moviesRepository = MoviesRepository();

  /// movie_id integer required
  void movieCredits({int? id}) async {
    emit(MovieCreditLoading());
    CreditResponse _result = await _moviesRepository.getCredit(id: id);
    emit(MovieCreditLoaded(result: _result));
  }
}
