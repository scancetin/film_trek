// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_trek/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:film_trek/views/widgets/custom_carousel.dart';
import 'package:film_trek/views/widgets/custom_search_bar.dart';
import 'package:film_trek/views/widgets/home_app_bar.dart';
import 'package:film_trek/views/widgets/movies_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieListLoaded || state is MovieListLoading) {
            return SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeAppBar(),
                    CustomSearchBar(),
                    CustomCarousel(state: state),
                    MoviesSection(),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
