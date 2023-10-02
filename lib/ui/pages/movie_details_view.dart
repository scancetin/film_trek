import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:film_trek/ui/widgets/movies_list_section.dart';
import 'package:film_trek/ui/widgets/rating_card.dart';
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
                    _buildMovieDetailsAppBar(context),
                    const SizedBox(height: 10),
                    _buildMovieDetails(state),
                    const SizedBox(height: 10),
                    MoviesListSection(
                      movieResponse: state.similarMovies,
                      listTitle: "Similar Movies",
                    ),
                  ],
                );
              } else {
                return const Center(child: Text("Error"));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMovieDetailsAppBar(BuildContext context) {
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

  Widget _buildMovieDetails(MovieDetailsLoaded state) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 220,
          color: Colors.deepOrangeAccent,
          child: Image.network(
              "https://image.tmdb.org/t/p/original/${state.movie.poster}"),
        ),
        // movie title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            state.movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        // movie infos -> release date | runtime | genre
        SizedBox(
          height: 25,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMovieInfoWidget(
                state.movieDetail.movieDetail.releaseDate.substring(0, 4),
                Icons.date_range_outlined,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(width: 1, color: Colors.white),
              ),
              _buildMovieInfoWidget(
                "${state.movieDetail.movieDetail.runtime} mins",
                Icons.timer_outlined,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(width: 1, color: Colors.white),
              ),
              _buildMovieInfoWidget(
                state.movieDetail.movieDetail.genres.first ?? "",
                Icons.local_movies_outlined,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // movie rating
        RatingCard(rating: state.movie.rating),
        // movie overview
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(state.movie.overview, textAlign: TextAlign.left),
        ),
      ],
    );
  }

  Widget _buildMovieInfoWidget(String info, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 3),
        Text(info),
      ],
    );
  }
}
