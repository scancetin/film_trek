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

class NavigateToMovieDetailsEvent extends MovieListEvent {
  final Movie movie;
  const NavigateToMovieDetailsEvent(this.movie);

  @override
  List<Object> get props => [movie];
}

class NavigateToSeeAllEvent extends MovieListEvent {
  final MovieResponse movies;
  const NavigateToSeeAllEvent(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchingMovieEvent extends MovieListEvent {
  final String movieName;
  const SearchingMovieEvent(this.movieName);

  // @override
  // List<Object> get props => [];
}
