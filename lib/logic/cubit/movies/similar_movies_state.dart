part of 'similar_movies_cubit.dart';

abstract class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();
}

class SimilarMoviesInitial extends SimilarMoviesState {
  @override
  List<Object> get props => [];
}

class SimilarMoviesLoading extends SimilarMoviesState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SimilarMoviesLoaded extends SimilarMoviesState {
  MovieResponse? result;
  SimilarMoviesLoaded({this.result});
  @override
  List<Object?> get props => [result];
}
