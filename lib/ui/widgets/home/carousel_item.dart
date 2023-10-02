import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselItem extends StatelessWidget {
  final Movie movie;
  const CarouselItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<MovieListBloc>().add(NavigateToMovieDetailsEvent(movie)),
      child: Image.network(
          "https://image.tmdb.org/t/p/original/${movie.backPoster}"),
    );
  }
}
