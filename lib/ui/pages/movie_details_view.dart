import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/ui/widgets/custom_image.dart';
import 'package:film_trek/ui/widgets/movies_list_section.dart';
import 'package:film_trek/ui/widgets/rating_card.dart';
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
                    _buildMovieDetailsAppBar(context),
                    _buildMovieDetails(state),
                    state.similarMovies.movies.isNotEmpty
                        ? MoviesListSection(
                            movieResponse: state.similarMovies,
                            listTitle: AppString.similarString)
                        : Container(),
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
    return ListTile(
      leading: IconButton(
        onPressed: () => context.read<MovieListBloc>().add(GetMovieListEvent()),
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  Widget _buildMovieDetails(MovieDetailsLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              height: AppSizes.posterScales[1] * 10,
              width: AppSizes.posterScales[0] * 10,
              child: CustomImage(poster: state.movie.poster),
            ),
          ),
          // movie title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              state.movie.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.largeFontSize),
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
          // movie rating
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RatingCard(rating: state.movie.rating),
          ),
          // movie overview
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(state.movie.overview, textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieInfoWidget(String info, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.darkText),
        const SizedBox(width: 3),
        Text(
          info,
          style: const TextStyle(color: AppColors.darkText),
        ),
      ],
    );
  }
}
