import 'package:cookmate/data/model/search_recipe.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:flutter/material.dart';


class RecipeItem extends StatelessWidget {
  // final Result title, thumb, times, portion;
  final Result resep;


  const RecipeItem({
    required this.resep,
  });

  @override
  Widget build(BuildContext context) {
    /*return Consumer<ResepFavoriteProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<bool>(
              future: provider.isFavorited(resep.key),
              builder: (context, snapshot) {
                var isFav = snapshot.data ?? false;*/
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, RecipeDetail.routeName, arguments: resep.key);
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, RecipeDetail.routeName, arguments: resep.key);
              },
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 120,
                height: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(resep.thumb),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resep.title,
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 16,
                    ),
                    Text(
                      resep.times,
                      style: orangeTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/soup_kitchen.png',
                      height: 16,
                      width: 16,
                    ),
                    Text(
                      resep.serving,
                      style: orangeTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                /*Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                icon: isFav
                                    ? IconButton(
                                  onPressed: () =>
                                      provider.removeFavorite(resep.key),
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                )
                                    : IconButton(
                                  onPressed: () =>
                                      provider.addFavorite(resep),
                                  icon: const Icon(Icons.favorite_border),
                                ),
                                onPressed: () {},
                              ),
                            ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
