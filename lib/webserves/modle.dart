class MovieModle {
  final int? id;
  final String? title;
  final String? release_date;
  final String? poster_path;
  final String? backdrop_path;
  final String? overview;
  final String? original_language;
  final double? vote_average;

  



  MovieModle({
    required this.title,
    required this.id,
    required this.release_date,
    this.poster_path,
    required this.vote_average,
    required this.overview,
    required this.original_language,
    this.backdrop_path,
  });

  factory MovieModle.fromJson(json) {
    return MovieModle(
      title: json ['title'] ,
      id: json ['id'] ,
      release_date: json ['release_date'],
      poster_path: json ['poster_path'],
      vote_average: json ['vote_average']?? 50.5,
      backdrop_path: json ['backdrop_path'],
      overview: json ['overview'],
      original_language: json ['original_language'],
    );
  }
}
//((((((((((((((((((((((((((((((()))))))))))))))))))))))))))))))
//((((((((((((((((((((((((((((((()))))))))))))))))))))))))))))))
//((((((((((((((((((((((((((((((()))))))))))))))))))))))))))))))
class MovieDetailsModle {
   final int? id;
  final String? name;
  final String? known_for_department;
  final String? profile_path;
  final String? backdrop_path;



  MovieDetailsModle({
    required this.name,
    required this.id,
    required this.known_for_department,
    this.profile_path,
    this.backdrop_path,
  });

  factory MovieDetailsModle.fromJson(json) {
    return MovieDetailsModle(
      name: json ['name'] ?? 'No title',
      id: json ['id'] ?? 112,
      known_for_department: json ['known_for_department']?? 'No title',
      profile_path: json ['profile_path']?? 'No title',
      backdrop_path: json ['backdrop_path']?? 'No title',
    );
  }
}