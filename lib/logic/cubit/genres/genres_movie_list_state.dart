part of 'genres_movie_list_cubit.dart';

abstract class GenresMovieListState extends Equatable {
  const GenresMovieListState();
}

class GenresMovieListInitial extends GenresMovieListState {
  @override
  List<Object> get props => [];
}

class GenresMovieListLoading extends GenresMovieListState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GenresMovieListLoaded extends GenresMovieListState {
  GenreResponse? result;
  GenresMovieListLoaded({this.result});
  @override
  List<Object?> get props => [result];
}
