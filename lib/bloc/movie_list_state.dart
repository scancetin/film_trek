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
  final int categoryIndex;
  const MovieListLoaded(this.movies, this.categoryIndex);

  @override
  List<Object> get props => [movies, categoryIndex];
}

final class MovieListError extends MovieListState {
  final String message;
  const MovieListError(this.message);

  @override
  List<Object> get props => [message];
}

//! movie details states
final class MovieDetailsLoaded extends MovieListState {
  final Movie movie;
  final MovieDetailResponse movieDetail;
  final MovieResponse similarMovies;

  const MovieDetailsLoaded(this.movieDetail, this.similarMovies, this.movie);

  @override
  List<Object> get props => [movieDetail, similarMovies];
}
