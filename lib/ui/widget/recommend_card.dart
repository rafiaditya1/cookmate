import 'package:cookmate/data/model/recommend_recipe.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  final Result resep;

  const RecommendCard({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RecipeDetail.routeName,
            arguments: resep.key);
      },
      child: Expanded(
        flex: 2,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(resep.thumb),
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
                        resep.portion,
                        style: orangeTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
