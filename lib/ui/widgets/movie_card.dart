// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:film_trek/ui/widgets/custom_image.dart';
import 'package:film_trek/ui/widgets/rating_card.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  final String poster;

  const MovieCard({super.key, this.movie, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
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
              child: Stack(
                children: [
                  CustomImage(poster: poster),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RatingCard(rating: movie?.rating ?? 0.0),
                          )),
                      Container(
                          height: 43,
                          color: AppColors.softBlack,
                          alignment: Alignment.center,
                          child: Text(
                            movie?.title ?? "",
                            style: TextStyle(
                                fontSize: AppSizes.movieTitleFontSize),
                          )),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
