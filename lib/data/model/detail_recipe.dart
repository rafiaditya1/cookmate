// To parse this JSON data, do
//
//     final recipeDetailResult = recipeDetailResultFromJson(jsonString);

import 'dart:convert';

RecipeDetailResult recipeDetailResultFromJson(String str) => RecipeDetailResult.fromJson(json.decode(str));

String recipeDetailResultToJson(RecipeDetailResult data) => json.encode(data.toJson());

class RecipeDetailResult {
  RecipeDetailResult({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final Results results;

  factory RecipeDetailResult.fromJson(Map<String, dynamic> json) => RecipeDetailResult(
    method: json["method"],
    status: json["status"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": results.toJson(),
  };
}

class Results {
  Results({
    required this.title,
    required this.thumb,
    required this.servings,
    required this.times,
    required this.dificulty,
    required this.desc,
    required this.needItem,
    required this.ingredient,
    required this.step,
  });

  final String title;
  final String thumb;
  final String servings;
  final String times;
  final String dificulty;
  final String desc;
  final List<NeedItem> needItem;
  final List<String> ingredient;
  final List<String> step;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    title: json["title"],
    thumb: json["thumb"],
    servings: json["servings"],
    times: json["times"],
    dificulty: json["dificulty"],
    desc: json["desc"],
    needItem: List<NeedItem>.from(json["needItem"].map((x) => NeedItem.fromJson(x))),
    ingredient: List<String>.from(json["ingredient"].map((x) => x)),
    step: List<String>.from(json["step"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "servings": servings,
    "times": times,
    "dificulty": dificulty,
    "desc": desc,
    "needItem": List<dynamic>.from(needItem.map((x) => x.toJson())),
    "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
    "step": List<dynamic>.from(step.map((x) => x)),
  };
}


class NeedItem {
  NeedItem({
    required this.itemName,
    required this.thumbItem,
  });

  final String itemName;
  final String thumbItem;

  factory NeedItem.fromJson(Map<String, dynamic> json) => NeedItem(
    itemName: json["item_name"],
    thumbItem: json["thumb_item"],
  );

  Map<String, dynamic> toJson() => {
    "item_name": itemName,
    "thumb_item": thumbItem,
  };
}
