import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final String rating;
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
              rating,
              style: const TextStyle(color: Colors.orangeAccent),
            ),
          ],
        ),
      ),
    );
  }
}
