// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_trek/views/home/custom_carousel.dart';
import 'package:film_trek/views/home/custom_search_bar.dart';
import 'package:film_trek/views/home/home_app_bar.dart';
import 'package:film_trek/views/home/movies_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //1
              HomeAppBar(),
              //1
              CustomSearchBar(),
              //4
              CustomCarousel(),
              //2
              MoviesSection(),
              //7
              // Expanded(flex: 5, child: Container(color: Colors.purpleAccent)),
            ],
          ),
        ),
      ),
    );
  }
}
