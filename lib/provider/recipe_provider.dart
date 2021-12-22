import 'dart:convert';

import 'package:cookmate/data/api/api_service.dart';
import 'package:cookmate/data/api/connection_service.dart';
import 'package:cookmate/data/model/detail_recipe.dart';
import 'package:cookmate/data/model/search_recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum ResultState { loading, noData, hasData, error, noConnection }

class RecipeProvider extends ChangeNotifier {
  late final BuildContext context;
  final apiService = ApiService();
  final connectionService = ConnectionService();

  String _message = '';
  String _query = '';
  late ResultState _state;
  late SearchResult _searchResult;

  String get message => _message;
  String get query => _query;
  ResultState get state => _state;
  SearchResult get result => _searchResult;

  RecipeProvider(this.context) {
    _fetchRecipeData();
  }

  void refresh() {
    _query = query;
    _fetchRecipeData();
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    _fetchRecipeData();
    notifyListeners();
  }

  Future<dynamic> _fetchRecipeData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final connection = await connectionService.connectionService(context);
      if (!connection.connected) {
        _state = ResultState.noConnection;
        notifyListeners();
        return _message = connection.message;
      }
      final recipe = await getRecipeData();
      if (recipe.results.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searchResult = recipe;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future<SearchResult> getRecipeData() async {
    String api;
    if (query == null || query == '') {
      api = ApiService.search;
    } else {
      api = ApiService.search + query;
    }
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return SearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Sorry we are failed to load data');
    }
  }
}
