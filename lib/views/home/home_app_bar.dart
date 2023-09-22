// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        color: Colors.orangeAccent,
        child: ListTile(
          leading: CircleAvatar(child: Icon(Icons.movie_filter)),
          title: Text(
            "Film Trek",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ),
      ),
    );
  }
}
