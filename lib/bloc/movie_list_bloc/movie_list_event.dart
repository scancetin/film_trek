part of 'movie_list_bloc.dart';

sealed class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class GetMovieListEvent extends MovieListEvent {}

class ChangeMovieListEvent extends MovieListEvent {
  final int categoryIndex;

  const ChangeMovieListEvent(this.categoryIndex);

  @override
  List<Object> get props => [categoryIndex];
}
