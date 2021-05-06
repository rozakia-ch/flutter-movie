import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/logic/models/trending/person_response.dart';
import 'package:flutter_movie_app/logic/repository/trending_repository.dart';
import 'package:meta/meta.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());
  TrendingRepository _trendingRepository = TrendingRepository();

  /// Media Type	Description
  /// * [all]	- Include all movies, TV shows and people in the results as a global trending list.
  /// * [movie]	- Show the trending movies in the results.
  /// * [tv]	- Show the trending TV shows in the results.
  /// * [person]	- Show the trending people in the results.
  ///
  /// Time Window	Description
  /// * [day]	- View the trending list for the day.
  /// * [week] -	View the trending list for the week.
  void getTrending() async {
    emit(TrendingLoading());
    PersonResponse _result = await _trendingRepository.getTrending();
    emit(TrendingLoaded(result: _result));
  }
}
