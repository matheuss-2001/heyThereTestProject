class MoviesViewModel {
  String id;
  String urlImage;
  String title;
  String description;
  String runtimeStr;
  String genres;
  List<GenreType> genreListType;
  String contentRating;
  String imDbRating;
  String imDbRatingVotes;
  String metacriticRating;

  String plot;
  String stars;
  List<StarList> starList;

  bool liked;

  MoviesViewModel({
    required this.id,
    required this.urlImage,
    required this.title,
    required this.description,
    required this.runtimeStr,
    required this.genres,
    required this.genreListType,
    required this.contentRating,
    required this.imDbRating,
    required this.imDbRatingVotes,
    required this.metacriticRating,
    required this.plot,
    required this.stars,
    required this.starList,
    this.liked = false
  });

  static MoviesViewModel fromJson(Map<String, dynamic> json) {
    return MoviesViewModel(
      id: json["id"]??"",
      urlImage: json["image"]??"",
      title: json["title"]??"",
      description: json["description"]??"",
      runtimeStr: json["runtimeStr"]??"",
      genres: json["genres"]??"",
      genreListType: json['genreList'] != null
          ? List.from(json['genreList'])
              .map((e) => GenreType.fromJson(e))
              .toList()
          : [],
      contentRating: json["contentRating"]??"",
      imDbRating: json["imDbRating"]??"",
      imDbRatingVotes: json["imDbRatingVotes"]??"",
      metacriticRating: json["metacriticRating"]??"",
      plot: json["plot"]??"",
      stars: json["stars"]??"",
      starList: json['starList'] != null
          ? List.from(json['starList'])
              .map((e) => StarList.fromJson(e))
              .toList()
          : [],
    );
  }
}

class GenreType {
  String key;
  String value;

  GenreType({
    this.key = '',
    this.value = '',
  });

  factory GenreType.fromJson(Map<String, dynamic> json) => GenreType(
        key: json['key'] ?? "",
        value: json['value'] ?? "",
      );
}

class StarList {
  String id;
  String name;

  StarList({
    this.id = '',
    this.name = '',
  });

  factory StarList.fromJson(Map<String, dynamic> json) => StarList(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
      );
}
