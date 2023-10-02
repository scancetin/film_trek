import 'package:film_trek/models/movie.dart';
import 'package:film_trek/style/themes.dart';
import 'package:film_trek/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesListSection extends StatelessWidget {
  final List<Movie> movieList;
  final String listTitle;
  const MoviesListSection(
      {super.key, required this.movieList, required this.listTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(listTitle, style: const TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: () {
                    //! goes to movielist
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
            padding: const EdgeInsets.only(bottom: 5),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: !movieList.isNotEmpty ? 20 : movieList.length,
              itemBuilder: (context, index) {
                final Movie? movie =
                    movieList.isNotEmpty ? movieList[index] : null;
                return MovieCard(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}
