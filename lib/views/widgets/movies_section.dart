// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:film_trek/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:film_trek/models/movie.dart';
import 'package:film_trek/repository/repository.dart';
import 'package:film_trek/style/themes.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatelessWidget {
  final MovieListState state;
  const MoviesSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final List<String> mockCategories = [
      "Popular",
      "Trending",
      "Top Rated",
      "In Theatres",
      "Upcoming",
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {},
                  child: Card(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(mockCategories[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: darkColorScheme.inversePrimary, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            height: 250,
            child: FutureBuilder(
              future: MovieRepository().getMoviesByName(name: ""),
              builder: (context, snapshot) {
                final List<Movie>? movies = snapshot.data?.movies;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          width: 200,
                          child: state is MovieListLoading
                              ? Center(child: CircularProgressIndicator())
                              : _buildCardItem(movies, index),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(List<Movie>? movies, int index) {
    final Movie movie = (state as MovieListLoaded).movies.movies[index];

    return Image.network("https://image.tmdb.org/t/p/original/${movie.poster}");
  }
}
