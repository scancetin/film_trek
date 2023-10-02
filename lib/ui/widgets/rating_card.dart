import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final num rating;
  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Card(
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
    );
  }
}
