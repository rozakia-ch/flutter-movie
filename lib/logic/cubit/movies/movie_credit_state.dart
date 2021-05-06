part of 'movie_credit_cubit.dart';

abstract class MovieCreditState extends Equatable {
  const MovieCreditState();
}

class MovieCreditInitial extends MovieCreditState {
  @override
  List<Object> get props => [];
}

class MovieCreditLoading extends MovieCreditState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class MovieCreditLoaded extends MovieCreditState {
  CreditResponse? result;
  MovieCreditLoaded({this.result});
  @override
  List<Object?> get props => [result];
}
