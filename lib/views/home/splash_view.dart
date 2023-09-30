// ignore_for_file: prefer_const_constructors

import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/views/home/home.dart';
import 'package:film_trek/views/home/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          // splash screen
          if (state is MovieListInitial) {
            return const Center(child: Icon(Icons.local_movies_outlined));
          }
          // ! loading kısmı splash olarak kullanılabilir
          // ! -> filmlere circularProgress koymak yerine bütün sayfaya splash koyulur.
          else if (state is MovieListLoaded || state is MovieListLoading) {
            return Home();
          } else if (state is MovieDetailsLoaded) {
            return MovieDetailsView();
          } else if (state is MovieListError) {
            // todo error text and load again button
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
