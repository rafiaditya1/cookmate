import 'dart:async';
import 'dart:convert';

import 'package:cookmate/data/api/connection_service.dart';
import 'package:cookmate/data/model/detail_recipe.dart';
import 'package:flutter/material.dart';
import 'package:cookmate/data/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ResultStateDetailRecipe { loading, noData, hasData, error, noConnection }

class DetailRecipeProvider extends ChangeNotifier {
  DetailRecipeProvider(this.context, {required this.id}) {
    _fetchDetailRecipelData();
  }

  final String id;
  final BuildContext context;
  final apiService = ApiService();
  final connectionService = ConnectionService();

  String _message = '';
  late ResultStateDetailRecipe _state;
  late RecipeDetailResult _detailRecipeResult;

  String get message => _message;
  ResultStateDetailRecipe get state => _state;
  RecipeDetailResult get result => _detailRecipeResult;

  Future<dynamic> _fetchDetailRecipelData() async {
    try {
      _state = ResultStateDetailRecipe.loading;
      notifyListeners();
      final connection = await connectionService.connectionService(context);
      if (!connection.connected) {
        _state = ResultStateDetailRecipe.noConnection;
        notifyListeners();
        return _message = connection.message;
      }
      final recipe = await getRecipeDetail();
      if (recipe.results == null) {
        _state = ResultStateDetailRecipe.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStateDetailRecipe.hasData;
        notifyListeners();
        return _detailRecipeResult = recipe;
      }
    } catch (e) {
      _state = ResultStateDetailRecipe.error;
      notifyListeners();
      return _message = 'error: $e';
    }
  }

  Future<RecipeDetailResult> getRecipeDetail() async {
    final response = await http.get(ApiService.detailRecipeList + id);
    if (response.statusCode == 200) {
      return RecipeDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Sorry, we are failed to load data');
    }
  }

  void refresh() {
    _fetchDetailRecipelData();
    notifyListeners();
  }
}
