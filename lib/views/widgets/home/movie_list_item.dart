// ignore_for_file: prefer_const_constructors, unnecessary_cast

import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListItem extends StatelessWidget {
  final MovieListState state;
  final int index;
  const MovieListItem({super.key, required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
    final Movie? movie = state is MovieListLoaded
        ? (state as MovieListLoaded).movies.movies[index]
        : null;

    return Card(
      child: SizedBox(
        width: 200,
        child: state is MovieListLoading
            ? const Center(child: CircularProgressIndicator())
            : GestureDetector(
                onTap: () => context
                    .read<MovieListBloc>()
                    .add(NavigateToMovieDetailsEvent(movie!)),
                child: Image.network(
                    "https://image.tmdb.org/t/p/original/${movie?.poster}"),
              ),
      ),
    );
  }
}
