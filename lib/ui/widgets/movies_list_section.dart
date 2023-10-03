import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:film_trek/models/movie_response.dart';
import 'package:film_trek/style/themes.dart';
import 'package:film_trek/ui/widgets/movie_card.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(listTitle, style: const TextStyle(fontSize: 20)),
              GestureDetector(
                onTap: () {
                  if (movieList.isNotEmpty) {
                    context
                        .read<MovieListBloc>()
                        .add(NavigateToSeeAllEvent(movieResponse));
                  }
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: darkColorScheme.inversePrimary,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 250,
          padding: const EdgeInsets.only(left: 15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.isNotEmpty ? movieList.length : 5,
            itemBuilder: (context, index) {
              final Movie? movie =
                  movieList.isNotEmpty ? movieList[index] : null;
              return SizedBox(
                width: 170,
                child: MovieCard(movie: movie, poster: movie!.poster),
              );
            },
          ),
        ),
      ],
    );
  }
}
