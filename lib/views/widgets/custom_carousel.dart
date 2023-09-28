// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_trek/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final MovieListState state;
  const CustomCarousel({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider.builder(
          options: CarouselOptions(enlargeCenterPage: true),
          itemCount: 3,
          itemBuilder: (context, index, _) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black54,
                ),
                child: state is MovieListLoading
                    ? Center(child: CircularProgressIndicator())
                    : _buildCarouselItem(index));
          }),
    );
  }

  Widget _buildCarouselItem(int index) {
    final Movie movie = (state as MovieListLoaded).movies.movies[index];

    return Image.network(
        "https://image.tmdb.org/t/p/original/${movie.backPoster}");
  }
}
