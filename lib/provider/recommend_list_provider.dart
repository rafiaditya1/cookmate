
import 'dart:async';
import 'dart:convert';


import 'package:cookmate/data/api/connection_service.dart';
import 'package:cookmate/data/model/recommend_recipe.dart';
import 'package:flutter/material.dart';
import 'package:cookmate/data/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ResultStateRecommend { Loading, NoData, HasData, Error, NoConnection }

class RecommendListProvider extends ChangeNotifier {
  late final BuildContext context;
  final apiService = ApiService();
  final connectionService = ConnectionService();

  String _message = '';
  String _query = '';
  late ResultStateRecommend _state;
  late RecommendResult _recommendResult;

  String get message => _message;

  String get query => _query;

  ResultStateRecommend get state => _state;

  RecommendResult get result => _recommendResult;

  RecommendListProvider(this.context) {
    _fetchRecommendData();
  }

  void refresh() {
    _query = query;
    _fetchRecommendData();
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    _fetchRecommendData();
    notifyListeners();
  }

  Future<dynamic> _fetchRecommendData() async {
    try {
      _state = ResultStateRecommend.Loading;
      notifyListeners();
      final connection = await connectionService.connectionService(context);
      if (!connection.connected) {
        _state = ResultStateRecommend.NoConnection;
        notifyListeners();
        return _message = connection.message;
      }
      final recommend = await getRecommendData();
      if (recommend.results.isEmpty) {
        _state = ResultStateRecommend.NoData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStateRecommend.HasData;
        notifyListeners();
        return _recommendResult = recommend;
      }
    } catch (e) {
      _state = ResultStateRecommend.Error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future<RecommendResult> getRecommendData() async {
    String api;
    api = ApiService.recommendList;

    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return RecommendResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Sorry, we are failed to load data');
    }
  }
}