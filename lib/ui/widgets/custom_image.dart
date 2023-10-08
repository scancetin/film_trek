import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String poster;
  const CustomImage({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://image.tmdb.org/t/p/original/$poster",
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) => const Center(
        child: Text("Error"),
      ),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : 0,
          ),
        );
      },
    );
  }
}
