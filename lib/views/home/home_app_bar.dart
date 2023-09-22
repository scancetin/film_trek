// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: CircleAvatar(child: Icon(Icons.movie_filter)),
        title: Text(
          "Film Trek",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
      ),
    );
  }
}
