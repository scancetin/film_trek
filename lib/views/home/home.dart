// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_trek/views/home/custom_carousel.dart';
import 'package:film_trek/views/home/custom_search_bar.dart';
import 'package:film_trek/views/home/home_app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // bottom: false,
        child: Column(
          children: [
            //1
            Expanded(flex: 1, child: HomeAppBar()),
            //1
            Expanded(flex: 1, child: CustomSearchBar()),
            //4
            Expanded(flex: 4, child: CustomCarousel()),
            //2
            Expanded(flex: 2, child: Container(color: Colors.purple)),
            //7
            Expanded(flex: 5, child: Container(color: Colors.purpleAccent)),
          ],
        ),
      ),
    );
  }
}
