
import 'dart:async';
import 'dart:convert';


import 'package:cookmate/data/api/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:cookmate/data/api/api_service.dart';
import 'package:cookmate/data/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ResultState { Loading, NoData, HasData, Error, NoConnection }

class CategoryListProvider extends ChangeNotifier {
  late final BuildContext context;
  final apiService = ApiService();
  final connectionService = ConnectionService();

  String _message = '';
  String _query = '';
  late ResultState _state;
  late CategoryResult _categoryResult;

  String get message => _message;

  String get query => _query;

  ResultState get state => _state;

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
      _state = ResultState.Loading;
      notifyListeners();
      final connection = await connectionService.connectionService(context);
      if (!connection.connected) {
        _state = ResultState.NoConnection;
        notifyListeners();
        return _message = connection.message;
      }
      final category = await getCategoryData();
      if (category.results.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _categoryResult = category;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error: $e';
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