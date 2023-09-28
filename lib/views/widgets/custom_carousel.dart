// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider.builder(
          options: CarouselOptions(enlargeCenterPage: true),
          itemCount: 3,
          itemBuilder: (context, index, _) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black54,
              ),
              child: Center(child: Text(index.toString())),
            );
          }),
    );
  }
}
