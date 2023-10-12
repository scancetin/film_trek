import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final num rating;
  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Card(
        color: AppColors.softBlack,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Colors.orangeAccent,
              ),
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
