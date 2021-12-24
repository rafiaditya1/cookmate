// import 'package:cookmate/data/database/database_helper.dart';
// import 'package:cookmate/data/model/search_recipe.dart';
// import 'package:flutter/cupertino.dart';

// import 'recipe_provider.dart';

// class ResepFavoriteProvider extends ChangeNotifier {
//   final DatabaseHelper databaseHelper;

//   ResepFavoriteProvider({required this.databaseHelper}) {
//     _getFavorite();
//   }

//   late ResultState _state;
//   ResultState get state => _state;

//   String _message = '';
//   String get message => _message;

//   List<Result> _favorite = [];
//   List<Result> get favorite => _favorite;

//   Result? _recipe;
//   Result? get recipe => _recipe;

//   void _getFavorite() async {
//     _favorite = await databaseHelper.getFavs();
//     if (_favorite.isNotEmpty) {
//       _state = ResultState.hasData;
//     } else {
//       _state = ResultState.noData;
//       _message = 'Empty Data';
//     }
//     notifyListeners();
//   }

//   void addFavorite(Result recipe) async {
//     try {
//       await databaseHelper.insertFav(recipe);
//       _getFavorite();
//     } catch (e) {
//       _state = ResultState.error;
//       _message =
//           'Sorry we cannot access the recipe data, check your network connection, if it still doesn\'t work, come back later!';
//       notifyListeners();
//     }
//   }

//   Future<bool> isFavorited(String id) async {
//     final favorited = await databaseHelper.getFavbyId(id);
//     return favorited.isNotEmpty;
//   }

//   void removeFavorite(String id) async {
//     try {
//       await databaseHelper.removeFav(id);
//       _getFavorite();
//     } catch (e) {
//       _state = ResultState.error;
//       _message =
//           'Sorry we cannot access the recipe data, check your network connection, if it still doesn\'t work, come back later!';
//       notifyListeners();
//     }
//   }
// }
