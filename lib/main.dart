import 'package:film_trek/bloc/movie_list_bloc.dart';
import 'package:film_trek/ui/pages/splash_view.dart';
import 'package:film_trek/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => MovieListBloc()..add(GetMovieListEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.dark(),
      ),
      title: 'Material App',
      home: const SplashView(),
    );
  }
}
