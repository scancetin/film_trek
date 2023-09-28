// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_trek/views/widgets/custom_carousel.dart';
import 'package:film_trek/views/widgets/custom_search_bar.dart';
import 'package:film_trek/views/widgets/home_app_bar.dart';
import 'package:film_trek/views/widgets/movies_section.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeAppBar(),
              CustomSearchBar(),
              CustomCarousel(),
              MoviesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
