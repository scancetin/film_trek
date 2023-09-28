import 'package:equatable/equatable.dart';
import 'package:film_trek/models/movie_response.dart';
import 'package:film_trek/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListInitial()) {
    final MovieRepository movieRepo = MovieRepository();

    on<GetMovieListEvent>((event, emit) async {
      try {
        emit(MovieListLoading());
        final MovieResponse movies = await movieRepo.getPopularMovies();
        emit(MovieListLoaded(movies));
      } catch (e) {
        emit(MovieListError(e.toString()));
      }
    });
    on<ChangeMovieListEvent>((event, emit) async {
      try {
        emit(MovieListLoading());
        final MovieResponse movies;
        switch (event.categoryIndex) {
          case 0:
            movies = await movieRepo.getPopularMovies();
          case 1:
            movies = await movieRepo.getTrendingMovies();
          case 2:
            movies = await movieRepo.getTopRatedMovies();
          case 3:
            movies = await movieRepo.getPlayingMovies();
          case 4:
            movies = await movieRepo.getUpcomingMovies();
          default:
            movies = await movieRepo.getPopularMovies();
        }
        emit(MovieListLoaded(movies));
      } catch (e) {
        emit(MovieListError(e.toString()));
      }
    });
  }
}
