// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    this.results = const [],
  });

  @JsonKey(name: 'results')
  List<SearchResultData> results;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        results:
            List<SearchResultData>.from(json["results"].map((x) => SearchResultData.fromJson(x as Map<String , dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class SearchResultData {
  SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  factory SearchResultData.fromJson(Map<String, dynamic> json) => SearchResultData(
        id: json["id"],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_title": originalTitle,
        "poster_path": posterPath,
      };
}
