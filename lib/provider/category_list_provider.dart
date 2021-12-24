import 'dart:async';
import 'dart:convert';

import 'package:cookmate/data/api/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:cookmate/data/api/api_service.dart';
import 'package:cookmate/data/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ResultStateCategory { loading, noData, hasData, error, noConnection }

class CategoryListProvider extends ChangeNotifier {
  late final BuildContext context;
  final apiService = ApiService();
  final connectionService = ConnectionService();

  String _message = '';
  String _query = '';
  late ResultStateCategory _state;
  late CategoryResult _categoryResult;

  String get message => _message;

  String get query => _query;

  ResultStateCategory get state => _state;

  CategoryResult get result => _categoryResult;

  CategoryListProvider(this.context) {
    _fetchCategoryData();
  }

  void refresh() {
    _query = query;
    _fetchCategoryData();
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    _fetchCategoryData();
    notifyListeners();
  }

  Future<dynamic> _fetchCategoryData() async {
    try {
      _state = ResultStateCategory.loading;
      notifyListeners();
      final connection = await connectionService.connectionService(context);
      if (!connection.connected) {
        _state = ResultStateCategory.noConnection;
        notifyListeners();
        return _message = connection.message;
      }
      final category = await getCategoryData();
      if (category.results.isEmpty) {
        _state = ResultStateCategory.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStateCategory.hasData;
        notifyListeners();
        return _categoryResult = category;
      }
    } catch (e) {
      _state = ResultStateCategory.error;
      notifyListeners();
      return _message = 'error: $e';
    }
  }

  Future<CategoryResult> getCategoryData() async {
    String api;
    api = ApiService.categoryList;

    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return CategoryResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Sorry, we are failed to load data');
    }
  }
}
