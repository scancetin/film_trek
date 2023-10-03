import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:film_trek/ui/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  final String poster;

  const MovieCard({super.key, this.movie, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: movie == null
          ? const Center(child: CircularProgressIndicator())
          : GestureDetector(
              onTap: () {
                if (movie != null) {
                  context
                      .read<MovieListBloc>()
                      .add(NavigateToMovieDetailsEvent(movie!));
                }
              },
              child: CustomImage(poster: poster),
            ),
    );
  }
}
