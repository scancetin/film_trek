// ignore_for_file: prefer_const_constructors

import 'package:film_trek/constants.dart';
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
        leading: Icon(
          Icons.search,
          color: AppColors.hintColor,
        ),
        hintText: "Search a title",
        hintStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: AppColors.hintColor)),
      ),
    );
  }
}
