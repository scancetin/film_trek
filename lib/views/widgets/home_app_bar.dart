import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.movie_filter)),
        title: const Text(
          "Film Trek",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: AppColors.favoriteColor,
          ),
        ),
      ),
    );
  }
}
