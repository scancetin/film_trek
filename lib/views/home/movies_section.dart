// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:film_trek/constants.dart';
import 'package:film_trek/themes.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> mockCategories = [
      "All",
      "Horror",
      "Sci-Fi",
      "History",
      "Comedy",
      "Family",
      "Animation",
      "Drama",
      "Romance",
      "Documentary",
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    // color: darkColorScheme.inversePrimary,
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(mockCategories[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style:
                        TextStyle(color: darkColorScheme.primary, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: 200,
                      child: Text(index.toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
