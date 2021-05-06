part of 'movie_top_rated_cubit.dart';

abstract class MovieTopRatedState extends Equatable {
  const MovieTopRatedState();
}

class MovieTopRatedInitial extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

class MovieTopRatedLoading extends MovieTopRatedState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class MovieTopRatedLoaded extends MovieTopRatedState {
  MovieResponse? result;
  MovieTopRatedLoaded({this.result});
  @override
  List<Object?> get props => [result];
}
