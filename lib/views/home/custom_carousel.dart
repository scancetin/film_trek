// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: CarouselSlider.builder(
          options: CarouselOptions(initialPage: 1, enlargeCenterPage: true),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.green),
              child: Center(child: Text(index.toString())),
            );
          }),
    );
  }
}
