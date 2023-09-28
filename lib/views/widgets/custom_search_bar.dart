// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SearchBar(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.only(left: 16)),
        leading: Icon(Icons.search),
        hintText: "Search a title",
        hintStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: Theme.of(context).hintColor)),
      ),
    );
  }
}
