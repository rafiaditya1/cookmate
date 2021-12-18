// To parse this JSON data, do
//
//     final recommendResult = recommendResultFromJson(jsonString);

import 'dart:convert';

RecommendResult recommendResultFromJson(String str) => RecommendResult.fromJson(json.decode(str));

String recommendResultToJson(RecommendResult data) => json.encode(data.toJson());

class RecommendResult {
  RecommendResult({
    required this.method,
    required this.status,
    required this.results,
  });

  String method;
  bool status;
  List<Result> results;

  factory RecommendResult.fromJson(Map<String, dynamic> json) => RecommendResult(
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

  String title;
  String thumb;
  String key;
  String times;
  String portion;
/*  Dificulty dificulty;*/

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    title: json["title"],
    thumb: json["thumb"],
    key: json["key"],
    times: json["times"],
    portion: json["portion"],
  /*  dificulty: dificultyValues.map[json["dificulty"]],*/
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

enum Dificulty { CUKUP_RUMIT, MUDAH, LEVEL_CHEF_PANJI }

final dificultyValues = EnumValues({
  "Cukup Rumit": Dificulty.CUKUP_RUMIT,
  "Level Chef Panji": Dificulty.LEVEL_CHEF_PANJI,
  "Mudah": Dificulty.MUDAH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap != map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
