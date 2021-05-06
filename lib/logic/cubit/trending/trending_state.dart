part of 'trending_cubit.dart';

@immutable
abstract class TrendingState extends Equatable {
  const TrendingState();
}

class TrendingInitial extends TrendingState {
  @override
  List<Object> get props => [];
}

class TrendingLoading extends TrendingState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TrendingLoaded extends TrendingState {
  PersonResponse result;
  TrendingLoaded({this.result});
  @override
  List<Object> get props => [result];
}
