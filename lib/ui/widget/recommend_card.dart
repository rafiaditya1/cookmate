import 'package:cookmate/data/model/recommend_recipe.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {

  final Result title, thumb, times, portion;

  const RecommendCard(
      {
        required this.title,
        required this.thumb,
        required this.times,
        required this.portion

      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(thumb.thumb),
          ),
        ),
        const SizedBox(width: 6),
        Column(
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
                  portion.portion,
                  style: orangeTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
