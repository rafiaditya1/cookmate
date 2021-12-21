import 'dart:async';
import 'dart:convert';

import 'package:cookmate/data/api/connection_service.dart';
import 'package:cookmate/data/model/detail_category.dart';
import 'package:flutter/material.dart';
import 'package:cookmate/data/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ResultStateDetailCategory { Loading, NoData, HasData, Error, NoConnection }

class DetailCategoryListProvider extends ChangeNotifier {
  DetailCategoryListProvider(this.context, {required this.id}) {
    _fetchRecommendData();
  }

  final String id;
  late final BuildContext context;
  final apiService = ApiService();
  final connectionService = ConnectionService();

  String _message = '';
  String _query = '';
  late ResultStateDetailCategory _state;
  late DetailCategoryResult _detailCategoryResult;

  String get message => _message;

  String get query => _query;

  ResultStateDetailCategory get state => _state;

  DetailCategoryResult get result => _detailCategoryResult;


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
      _state = ResultStateDetailCategory.Loading;
      notifyListeners();
      final connection = await connectionService.connectionService(context);
      if (!connection.connected) {
        _state = ResultStateDetailCategory.NoConnection;
        notifyListeners();
        return _message = connection.message;
      }
      final detailCategory = await getDetailCategoryData();
      if (detailCategory.results.isEmpty) {
        _state = ResultStateDetailCategory.NoData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStateDetailCategory.HasData;
        notifyListeners();
        return _detailCategoryResult = detailCategory;
      }
    } catch (e) {
      _state = ResultStateDetailCategory.Error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future<DetailCategoryResult> getDetailCategoryData() async {
    final response = await http.get(ApiService.detailCategoryList + id);
    if (response.statusCode == 200) {
      return DetailCategoryResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Sorry, we are failed to load dataa');
    }
  }
}
