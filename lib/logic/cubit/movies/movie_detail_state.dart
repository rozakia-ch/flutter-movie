part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class MovieDetailLoaded extends MovieDetailState {
  MovieDetailResponse result;
  MovieDetailLoaded({this.result});
  @override
  List<Object> get props => [result];
}
