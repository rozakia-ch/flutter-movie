part of 'discover_movie_cubit.dart';

abstract class DiscoverMovieState extends Equatable {
  const DiscoverMovieState();
}

class DiscoverMovieInitial extends DiscoverMovieState {
  @override
  List<Object> get props => [];
}

class DiscoverMovieLoading extends DiscoverMovieState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class DiscoverMovieLoaded extends DiscoverMovieState {
  DiscoverResponse? result;
  DiscoverMovieLoaded({this.result});
  @override
  List<Object?> get props => [result];
}
