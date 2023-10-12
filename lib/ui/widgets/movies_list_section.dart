import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:film_trek/models/movie_response.dart';
import 'package:film_trek/ui/widgets/movie_card.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListSection extends StatelessWidget {
  final MovieResponse movieResponse;
  final String listTitle;
  const MoviesListSection(
      {super.key, required this.movieResponse, required this.listTitle});

  @override
  Widget build(BuildContext context) {
    final List<Movie> movieList = movieResponse.movies;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(listTitle,
                  style: const TextStyle(fontSize: AppSizes.largeFontSize)),
              GestureDetector(
                onTap: () {
                  if (movieList.isNotEmpty) {
                    context
                        .read<MovieListBloc>()
                        .add(NavigateToSeeAllEvent(movieResponse));
                  }
                },
                child: const Text(
                  AppString.seeAllString,
                  style: TextStyle(
                    color: AppColors.blueAccent,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: AppSizes.posterScales[1] * AppSizes.posterSize,
          padding: const EdgeInsets.only(left: 15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.isNotEmpty ? movieList.length : 5,
            itemBuilder: (context, index) {
              final Movie? movie =
                  movieList.isNotEmpty ? movieList[index] : null;
              return SizedBox(
                width: AppSizes.posterScales[0] * AppSizes.posterSize,
                child: MovieCard(movie: movie, poster: movie!.poster),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
