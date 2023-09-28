import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SearchBar(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.only(left: 16)),
        leading: const Icon(Icons.search),
        hintText: "Search a title",
        hintStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: Theme.of(context).hintColor)),
      ),
    );
  }
}
