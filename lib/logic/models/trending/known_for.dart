class KnownFor {
  String? overview;
  bool? adult;
  String? backdropPath;
  String? mediaType;
  List<int>? genreIds;

  double? id;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  String? title;
  bool? video;
  double? voteAverage;
  double? popularity;
  double? voteCount;
  String? releaseDate;
  String? firstAirDate;
  String? originalName;
  List<String>? originCountry;
  String? name;

  KnownFor(
      {this.overview,
      this.adult,
      this.backdropPath,
      this.mediaType,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.title,
      this.video,
      this.voteAverage,
      this.popularity,
      this.voteCount,
      this.releaseDate,
      this.firstAirDate,
      this.originalName,
      this.originCountry,
      this.name});

  KnownFor.fromJson(Map<String, dynamic> json) {
    overview = json['overview'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    mediaType = json['media_type'];
    genreIds = (json['genre_ids'] is List<int>) ? json['genre_ids'].cast<int>() : [];
    id = json['id'] is int ? (json['id'] as int).toDouble() : json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    popularity = json['popularity'];
    voteCount =
        json['vote_count'] is int ? (json['vote_count'] as int).toDouble() : json['vote_count'];
    releaseDate = json['release_date'];
    firstAirDate = json['first_air_date'];
    originalName = json['original_name'];
    originCountry = (json['origin_country'] != null)
        ? json['origin_country'].cast<String>()
        : json['origin_country'];
    name = json['name'];
  }
}
