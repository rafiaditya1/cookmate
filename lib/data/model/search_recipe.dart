// To parse required this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

SearchResult searchResultFromJson(String str) =>
    SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  SearchResult({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<Result> results;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        method: json["method"],
        status: json["status"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "status": status,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.title,
    required this.thumb,
    required this.key,
    required this.times,
    required this.serving,
    // required this.difficulty,
  });

  final String title;
  final String thumb;
  final String key;
  final String times;
  final String serving;
  // final Difficulty difficulty;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        thumb: json["thumb"],
        key: json["key"],
        times: json["times"],
        serving: json["serving"],
        // difficulty: difficultyValues.map[json["difficulty"]],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "key": key,
        "times": times,
        "serving": serving,
        // "difficulty": difficultyValues.reverse[difficulty],
      };
}

enum Difficulty { cukupRumit, mudah, levelChefPanji }

final difficultyValues = EnumValues({
  "Cukup Rumit": Difficulty.cukupRumit,
  "Level Chef Panji": Difficulty.levelChefPanji,
  "Mudah": Difficulty.mudah
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
