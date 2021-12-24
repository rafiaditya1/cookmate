import 'package:cookmate/provider/recipe_provider.dart';
import 'package:cookmate/provider/resep_favorite_provider.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:cookmate/ui/search/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList());
  }

  Widget _buildList() {
    return Consumer<ResepFavoriteProvider>(
      builder: (context, provider, child){
        if (provider.state == ResultState.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.favorite.length,
            itemBuilder: (context, index) {
              final response = provider.recipe;
              return RecipeItem(
                resep: provider.favorite[index],
              );
            },
          );
        } else {
          return Center(
            child: Text(provider.message),
          );
        }
      }
    );
  }
}
