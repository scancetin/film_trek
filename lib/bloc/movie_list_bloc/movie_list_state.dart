part of 'movie_list_bloc.dart';

sealed class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

final class MovieListInitial extends MovieListState {}

final class MovieListLoading extends MovieListState {}

final class MovieListLoaded extends MovieListState {
  final MovieResponse movies;
  const MovieListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

final class MovieListError extends MovieListState {
  final String message;
  const MovieListError(this.message);

  @override
  List<Object> get props => [message];
}
