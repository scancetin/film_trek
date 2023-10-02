// ignore_for_file: prefer_const_constructors

import 'package:film_trek/models/movie.dart';
import 'package:film_trek/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class SeeAllView extends StatelessWidget {
  final List<Movie> movieList;
  const SeeAllView({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 5),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return MovieCard(movie: movieList[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
