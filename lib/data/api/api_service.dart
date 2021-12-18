import 'package:flutter/foundation.dart';


class ApiService {
  static const String baseUrl = 'https://masak-apa.tomorisakura.vercel.app';
  static const String categoryList = 'https://masak-apa.tomorisakura.vercel.app/api/categorys/recipes';
  static const String recommendList = 'https://masak-apa.tomorisakura.vercel.app/api/recipes/1';
  static const String detailRecipeList = 'https://masak-apa.tomorisakura.vercel.app/api/recipe/:key';
  static const String detailCategoryList = 'https://masak-apa.tomorisakura.vercel.app/api/categorys/recipes/masakan-hari-raya';
}