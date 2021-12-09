import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/nasgor.jpeg'),
          ),
        ),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resep Ayam Bacem Khas \nYogyakarta, Menu Sehari-Hari \nyang Nikmat',
              style: blackTextStyle.copyWith(
                fontSize: 13,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 16,
                ),
                Text(
                  ' 1 Jam',
                  style: orangeTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.food_bank,
                  size: 16,
                ),
                Text(
                  ' 4 Porsi',
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
