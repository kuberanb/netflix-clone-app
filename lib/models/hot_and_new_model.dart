
// To parse this JSON data, do
//
//     final hotAndNewResp = hotAndNewRespFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

HotAndNewResp hotAndNewRespFromJson(String str) => HotAndNewResp.fromJson(json.decode(str));

String hotAndNewRespToJson(HotAndNewResp data) => json.encode(data.toJson());

class HotAndNewResp {
    HotAndNewResp({
        this.page,
        this.results = const [],
    });

    @JsonKey(name: "page")
    int? page;

    @JsonKey(name: "results")
    List<HotAndNewData> results;

    factory HotAndNewResp.fromJson(Map<String, dynamic> json) => HotAndNewResp(
        page: json["page"],
        results: List<HotAndNewData>.from(json["results"].map((x) => HotAndNewData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class HotAndNewData {
    HotAndNewData({

        
         this.backdropPath,
         this.id,
         this.originalLanguage,
         this.originalTitle,
         this.overview,
         this.posterPath,
         this.releaseDate,
         this.title,
    });

     @JsonKey(name: "backdrop_path")
    String? backdropPath;

    @JsonKey(name: "id")
    int? id;

    @JsonKey(name: "original_language")
    String? originalLanguage;

    @JsonKey(name: "original_title")
    String? originalTitle;

    @JsonKey(name: "overview")
    String? overview;

    @JsonKey(name: "poster_path")
    String? posterPath;

    @JsonKey(name: "release_date")
    String? releaseDate;

    @JsonKey(name: "title")
    String? title;

    factory HotAndNewData.fromJson(Map<String, dynamic> json) => HotAndNewData(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
    };
}
