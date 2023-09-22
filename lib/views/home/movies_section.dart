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

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Container(
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.centerLeft,
                color: Colors.pink,
                child: Text("Categories")),
            Container(
              padding: EdgeInsets.only(bottom: 5),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.purple, child: Text("Most Popular")),
                  Container(color: Colors.purple, child: Text("See All")),
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
                  return Card(
                    child: Container(
                      width: 200,
                      child: Text(index.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
