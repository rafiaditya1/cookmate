import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }

  // Widget _buildList() {
  //   return Consumer<ResepFavoriteProvider>(
  //     builder: (context, provider, child){
  //       if (provider.state == ResultState.hasData) {
  //         return ListView.builder(
  //           padding: const EdgeInsets.all(16),
  //           itemCount: provider.favorite.length,
  //           itemBuilder: (context, index) {
  //             final response = provider.recipe;
  //             return RecipeItem(
  //               resep: provider.favorite[index],
  //             );
  //           },
  //         );
  //       } else {
  //         return Center(
  //           child: Text(provider.message),
  //         );
  //       }
  //     }
  //   );
  // }
}
