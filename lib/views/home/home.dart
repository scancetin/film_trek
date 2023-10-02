// ignore_for_file: prefer_const_constructors, unnecessary_cast

import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/views/widgets/home/custom_carousel.dart';
import 'package:film_trek/views/widgets/home/custom_search_bar.dart';
import 'package:film_trek/views/widgets/home/home_app_bar.dart';
import 'package:film_trek/views/widgets/home/movies_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const CustomSearchBar(),
                  CustomCarousel(state: state),
                  MoviesSection(state: state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
