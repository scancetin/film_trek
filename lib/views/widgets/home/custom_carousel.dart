import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_trek/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCarousel extends StatelessWidget {
  final MovieListState state;
  const CustomCarousel({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider.builder(
          options: CarouselOptions(enlargeCenterPage: true),
          itemCount: state is MovieDetailsLoaded ? 3 : 0,
          itemBuilder: (context, index, _) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black54,
                ),
                child: state is MovieListLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _buildCarouselItem(context, index));
          }),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    final Movie movie = (state as MovieListLoaded).movies.movies[index];
    return GestureDetector(
      onTap: () =>
          context.read<MovieListBloc>().add(NavigateToMovieDetailsEvent(movie)),
      child: Image.network(
          "https://image.tmdb.org/t/p/original/${movie.backPoster}"),
    );
  }
}
