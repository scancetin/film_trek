import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/style/themes.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:film_trek/views/widgets/home/category_item.dart';
import 'package:film_trek/views/widgets/home/movie_list_item.dart';
import 'package:film_trek/views/widgets/home/carousel_item.dart';
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
                  _buildHomeAppBar(),
                  _buildCustomSearchBar(context),
                  _buildCustomCarousel(state),
                  _buildCategorySection(state),
                  _buildMoviesSection(state),
                ],
              ),
            ),
          );
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
    ),
  );
}

Widget _buildCustomCarousel(MovieListState state) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: CarouselSlider.builder(
      options: CarouselOptions(enlargeCenterPage: true),
      itemCount: state is MovieListLoaded ? 3 : 0,
      itemBuilder: (context, index, _) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black54,
          ),
          child: state is MovieListLoaded
              ? CarouselItem(movie: state.movies.movies[index])
              : const Center(child: CircularProgressIndicator()),
        );
      },
    ),
  );
}

Widget _buildCategorySection(MovieListState state) {
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
          padding: const EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Categories",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mockCategories.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                state: state,
                categoryName: mockCategories[index],
                index: index,
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildMoviesSection(MovieListState state) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Movies", style: TextStyle(fontSize: 20)),
              GestureDetector(
                onTap: () {
                  //! goes to movielist
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: darkColorScheme.inversePrimary,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state is MovieListLoading
                ? 20
                : (state as MovieListLoaded).movies.movies.length,
            itemBuilder: (context, index) {
              return MovieListItem(state: state, index: index);
            },
          ),
        ),
      ],
    ),
  );
}
