import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/ui/widgets/movie_card.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is SeeAllLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSeeAllAppBar(context),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 170 / 250,
                        children: List.generate(
                            state.movies.movies.length,
                            (index) => MovieCard(
                                  movie: state.movies.movies[index],
                                  poster: state.movies.movies[index].poster,
                                )),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }

  Widget _buildSeeAllAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: IconButton(
          onPressed: () =>
              context.read<MovieListBloc>().add(GetMovieListEvent()),
          icon: const Icon(Icons.arrow_back_ios_new),
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
