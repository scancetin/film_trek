import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/ui/widgets/movie_card.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:film_trek/ui/widgets/movies_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          if (state is MovieListLoaded) {
            return SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHomeAppBar(),
                    _buildCustomSearchBar(context),
                    _buildCustomCarousel(state),
                    _buildCategorySection(state),
                    MoviesListSection(
                      movieResponse: state.movies,
                      listTitle: "Movies",
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}

Widget _buildHomeAppBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.movie_filter)),
      title: const Text(
        "Film Trek",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

Widget _buildCustomSearchBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: SearchBar(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.only(left: 16)),
      leading: const Icon(Icons.search),
      hintText: "Search a title",
      hintStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(color: Theme.of(context).hintColor)),
      onSubmitted: (value) {
        context.read<MovieListBloc>().add(SearchingMovieEvent(value));
      },
    ),
  );
}

Widget _buildCustomCarousel(MovieListLoaded state) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: CarouselSlider.builder(
      options: CarouselOptions(enlargeCenterPage: true, height: 190),
      itemCount: 3,
      itemBuilder: (context, index, _) {
        return MovieCard(
            movie: state.movies.movies[index],
            poster: state.movies.movies[index].backPoster);
      },
    ),
  );
}

Widget _buildCategorySection(MovieListLoaded state) {
  final List<String> mockCategories = [
    "Popular",
    "Trending",
    "Top Rated",
    "In Theatres",
    "Upcoming",
  ];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        alignment: Alignment.centerLeft,
        child: const Text(
          "Categories",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Container(
        height: 35,
        padding: const EdgeInsets.only(left: 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mockCategories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                context.read<MovieListBloc>().add(ChangeMovieListEvent(index));
              },
              child: Card(
                child: Container(
                  width: 100,
                  color: state.categoryIndex == index
                      ? Colors.amberAccent
                      : Colors.pink,
                  alignment: Alignment.center,
                  child: Text(mockCategories[index]),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
