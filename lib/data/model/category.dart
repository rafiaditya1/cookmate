// To parse this JSON data, do
//
//     final categoryResult = categoryResultFromJson(jsonString);

import 'dart:convert';

CategoryResult categoryResultFromJson(String str) => CategoryResult.fromJson(json.decode(str));

String categoryResultToJson(CategoryResult data) => json.encode(data.toJson());

class CategoryResult {
  CategoryResult({
    required this.method,
    required this.status,
    required this.results,
  });

  String method;
  bool status;
  List<Result> results;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
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
    required this.category,
    required this.url,
    required this.key,
  });

  String category;
  String url;
  String key;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"],
    url: json["url"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "url": url,
    "key": key,
  };
}





/*

import 'dart:convert';


class ResponseList {

  List<CategoryList> results;

  ResponseList(
      {required this.results});

  factory ResponseList.fromJson(Map<String, dynamic> json) => ResponseList(
    results: List<CategoryList>.from(
      (json["results"] as List).map((x) => CategoryList.fromJson(x))
          .where((results) =>
      results.category != null &&
         results.key != null
      )
    )
  );


  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class CategoryList{
  String category;
  String key;

  CategoryList({
    required this.category,
    required this.key
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
      category: json['category'].toString(),
      key: json['key'].toString()
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'key': key
  };
}*/
