import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  final MovieListState state;
  final int index;
  final String categoryName;

  const CategoryItem(
      {super.key,
      required this.categoryName,
      required this.index,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<MovieListBloc>().add(ChangeMovieListEvent(index));
      },
      child: Card(
        child: Container(
          width: 100,
          color: state is MovieListLoaded
              ? (state as MovieListLoaded).categoryIndex == index
                  ? Colors.amberAccent
                  : Colors.pink
              : Colors.pink,
          alignment: Alignment.center,
          child: Text(categoryName),
        ),
      ),
    );
  }
}
