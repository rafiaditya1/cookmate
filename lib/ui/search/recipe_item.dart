import 'package:cookmate/data/model/search_recipe.dart';
import 'package:cookmate/provider/recipe_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeItem extends StatelessWidget {
  final Result title, thumb, times, portion;

  final Function() onPressed;

  const RecipeItem({
    required this.title,
    required this.thumb,
    required this.times,
    required this.portion,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              width: 120,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(thumb.thumb),
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
                title.title,
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
                    times.times,
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
                    portion.serving,
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
    );
  }
}
