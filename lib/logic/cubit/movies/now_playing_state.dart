part of 'now_playing_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();
}

class NowPlayingInitial extends NowPlayingState {
  @override
  List<Object> get props => [];
}

class NowPlayingLoading extends NowPlayingState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class NowPlayingLoaded extends NowPlayingState {
  NowPlayingResponse result;
  NowPlayingLoaded({this.result});
  @override
  List<Object> get props => [result];
}
