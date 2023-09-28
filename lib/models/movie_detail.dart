import 'package:film_trek/models/genre.dart';

class MovieDetail {
  final int? id;
  final List<Genre>? genres;
  final String? releaseDate;
  final int? runtime;

  MovieDetail(this.id, this.genres, this.releaseDate, this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        genres =
            (json["genres"] as List).map((i) => Genre.fromJson(i)).toList(),
        releaseDate = json["release_date"],
        runtime = json["runtime"];
}
