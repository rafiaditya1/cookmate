// To parse this JSON data, do
//
//     final detailCategoryResult = detailCategoryResultFromJson(jsonString);

import 'dart:convert';

DetailCategoryResult detailCategoryResultFromJson(String str) => DetailCategoryResult.fromJson(json.decode(str));

String detailCategoryResultToJson(DetailCategoryResult data) => json.encode(data.toJson());

class DetailCategoryResult {
  DetailCategoryResult({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<Result> results;

  factory DetailCategoryResult.fromJson(Map<String, dynamic> json) => DetailCategoryResult(
    method: json["method"],
    status: json["status"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
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
    required this.portion,
/*    required this.dificulty,*/
  });

  final String title;
  final String thumb;
  final String key;
  final String times;
  final String portion;
/*  final Dificulty dificulty;*/

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    title: json["title"],
    thumb: json["thumb"],
    key: json["key"],
    times: json["times"],
    portion: json["portion"],
/*    dificulty: dificultyValues.map[json["dificulty"]]*/
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "key": key,
    "times": times,
    "portion": portion,
/*    "dificulty": dificultyValues.reverse[dificulty],*/
  };
}
/*

enum Dificulty { CUKUP_RUMIT, MUDAH }

final dificultyValues = EnumValues({
  "Cukup Rumit": Dificulty.CUKUP_RUMIT,
  "Mudah": Dificulty.MUDAH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
*/
