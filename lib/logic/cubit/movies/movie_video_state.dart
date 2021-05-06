part of 'movie_video_cubit.dart';

abstract class MovieVideoState extends Equatable {
  const MovieVideoState();
}

class MovieVideoInitial extends MovieVideoState {
  @override
  List<Object> get props => [];
}

class MovieVideoLoading extends MovieVideoState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class MovieVideoLoaded extends MovieVideoState {
  VideoResponse result;
  MovieVideoLoaded({this.result});
  @override
  List<Object> get props => [result];
}
