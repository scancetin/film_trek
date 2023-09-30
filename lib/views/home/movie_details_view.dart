// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: BlocBuilder<MovieListBloc, MovieListState>(
            builder: (context, state) {
              if (state is MovieDetailsLoaded) {
                return Column(
                  children: [
                    MovieDetailsAppBar(),
                    //! movie image
                    SizedBox(height: 10),
                    Container(
                        height: 300,
                        width: 220,
                        color: Colors.deepOrangeAccent,
                        child: Image.network(
                            "https://image.tmdb.org/t/p/original/${state.movie.poster}")),
                    //! movie title
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Spider-Man No Way Home",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //! movie details
                    SizedBox(
                      height: 25,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            Icon(Icons.date_range_outlined),
                            SizedBox(width: 3),
                            Text("2021")
                          ]),
                          Padding(
                            //! can do dot instead of |
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(width: 1, color: Colors.white),
                          ),
                          Row(children: [
                            Icon(Icons.timer_outlined),
                            SizedBox(width: 3),
                            Text("120 mins")
                          ]),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(width: 1, color: Colors.white),
                          ),
                          Row(children: [
                            Icon(Icons.local_movies_outlined),
                            SizedBox(width: 3),
                            Text("Action")
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    //! movie rating
                    SizedBox(
                      width: 70,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.orangeAccent,
                            ),
                            Text(
                              "3.5",
                              style: TextStyle(color: Colors.orangeAccent),
                            ),
                          ],
                        ),
                      ),
                    )
                    //! movie summary
                  ],
                );
              } else {
                return Center(child: Text("Error"));
              }
            },
          ),
        ),
      ),
    );
  }
}

class MovieDetailsAppBar extends StatelessWidget {
  const MovieDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: IconButton(
          onPressed: () =>
              context.read<MovieListBloc>().add(GetMovieListEvent()),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        trailing: IconButton(
          onPressed: () {
            // todo: favorite movies page
          },
          icon: const Icon(
            Icons.favorite,
            color: AppColors.favoriteColor,
          ),
        ),
      ),
    );
  }
}
