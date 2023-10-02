import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  const MovieCard({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 200,
        child: movie == null
            ? const Center(child: CircularProgressIndicator())
            : GestureDetector(
                onTap: () => context
                    .read<MovieListBloc>()
                    .add(NavigateToMovieDetailsEvent(movie!)),
                child: Image.network(
                    "https://image.tmdb.org/t/p/original/${movie!.poster}"),
              ),
      ),
    );
  }
}
