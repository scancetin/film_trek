import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/ui/pages/home.dart';
import 'package:film_trek/ui/pages/movie_details_view.dart';
import 'package:film_trek/ui/pages/see_all_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListInitial ||
              state is MovieDetailsLoading ||
              state is SeeAllLoading) {
            return const Center(child: Icon(Icons.local_movies_outlined));
          } else if (state is MovieListLoaded || state is MovieListLoading) {
            return const Home();
          } else if (state is MovieDetailsLoaded) {
            return const MovieDetailsView();
          } else if (state is SeeAllLoaded) {
            return const SeeAllView();
          } else if (state is MovieListError) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
