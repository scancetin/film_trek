// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(color: Colors.pink, child: Text("Categories")),
          Container(
            height: 40,
            color: Colors.pink,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(mockCategories[index]),
                  ),
                );
              },
            ),
          ),
          Container(color: Colors.purple, child: Text("Most Popular")),
        ],
      ),
    );
  }
}
