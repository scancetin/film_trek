import 'dart:ui';

class AppColors {
  static const Color backgroundColor = Color(0xFF1F1D2B);
  static const Color softBlack = Color(0xFF252836);
  static const Color blueAccent = Color(0xFF12CDD9);
  static const Color hintColor = Color(0xFF92929D);
  static const Color darkText = Color.fromARGB(255, 180, 176, 176);
  static const Color starColor = Color(0xFFFF9700);
}

class AppSizes {
  static const List<double> posterScales = [27, 40];
  static const double posterSize = 7.5;
  static const double largeFontSize = 25;
  static const double largestFontSize = 30;
  static const double movieTitleFontSize = 15;
}

class AppString {
  static const String appTitle = "Film Trek";
  static const String searchBar = "Search a title";
  static const String catsString = "Categories";
  static const String movieString = "Movies";
  static const String seeAllString = "See All";
  static const String similarString = "Similar Movies";
  static const List<String> cats = [
    "Popular",
    "Trending",
    "Top Rated",
    "In Theatres",
    "Upcoming",
  ];
}
