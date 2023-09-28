class MovieDetail {
  final int id;
  final List<dynamic> genres;
  final String releaseDate;
  final int runtime;

  MovieDetail(this.id, this.genres, this.releaseDate, this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        genres = (json["genres"] as List).map((i) => i["name"]).toList(),
        releaseDate = json["release_date"],
        runtime = json["runtime"];
}
