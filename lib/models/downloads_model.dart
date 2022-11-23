

// // To parse this JSON data, do
// //
// //     final downloads = DownloadsFromJson(jsonString);

// import 'dart:convert';

// Downloads downloadsFromJson(String str) => Downloads.fromJson(json.decode(str));

// String downloadsToJson(Downloads data) => json.encode(data.toJson());

// class Downloads {
//     Downloads({
//         required this.page,
//         required this.results,
//         required this.totalPages,
//         required this.totalResults,
//     });

//     int page;
//     List<Result> results;
//     int totalPages;
//     int totalResults;

//     factory Downloads.fromJson(Map<String, dynamic> json) => Downloads(
//         page: json["page"],
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//         totalPages: json["total_pages"],
//         totalResults: json["total_results"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//         "total_pages": totalPages,
//         "total_results": totalResults,
//     };
// }

// class Result {
//     Result({
//         required this.adult,
//         required this.backdropPath,
//         required this.id,
//         required this.title,
//         required this.originalLanguage,
//         required this.originalTitle,
//         required this.overview,
//         required this.posterPath,
//         required this.mediaType,
//         required this.genreIds,
//         required this.popularity,
//         required this.releaseDate,
//         required this.video,
//         required this.voteAverage,
//         required this.voteCount,
//     });

//     bool adult;
//     String backdropPath;
//     int id;
//     String title;
//     String originalLanguage;
//     String originalTitle;
//     String overview;
//     String posterPath;
//     String mediaType;
//     List<int> genreIds;
//     double popularity;
//     DateTime releaseDate;
//     bool video;
//     double voteAverage;
//     int voteCount;

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         id: json["id"],
//         title: json["title"],
//         originalLanguage: json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         posterPath: json["poster_path"],
//         mediaType: json["media_type"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         popularity: json["popularity"].toDouble(),
//         releaseDate: DateTime.parse(json["release_date"]),
//         video: json["video"],
//         voteAverage: json["vote_average"].toDouble(),
//         voteCount: json["vote_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "adult": adult,
//         "backdrop_path": backdropPath,
//         "id": id,
//         "title": title,
//         "original_language": originalLanguage,
//         "original_title": originalTitle,
//         "overview": overview,
//         "poster_path": posterPath,
//         "media_type": mediaType,
//         "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//         "popularity": popularity,
//         "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "video": video,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//     };
// }

// To parse this JSON data, do
//
//     final downloads = downloadsFromJson(jsonString);

import 'dart:convert';

Downloads downloadsFromJson(String str) => Downloads.fromJson(json.decode(str));

String downloadsToJson(Downloads data) => json.encode(data.toJson());

class Downloads {
    Downloads({
        required this.posterPath,
        required this.title,
    });

    String posterPath;

    String title;

    factory Downloads.fromJson(Map<String, dynamic> json) => Downloads(
        posterPath: json["poster_path"], title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "title": title,
    };
}

