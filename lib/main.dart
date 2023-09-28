// ignore_for_file: prefer_const_constructors

import 'package:film_trek/views/home/home.dart';
import 'package:flutter/material.dart';
import 'style/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      title: 'Material App',
      home: Home(),
    );
  }
}
