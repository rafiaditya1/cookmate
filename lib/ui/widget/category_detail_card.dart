import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoryDetailCard extends StatelessWidget {
  const CategoryDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 125,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                'assets/nasgor.jpeg',
                width: 125,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 18),
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
                Row(
                  children: [
                    const Icon(
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
                    Image.asset(
                      'assets/soup_kitchen.png',
                      height: 16,
                      width: 16,
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
            ),
          ],
        ),
      ),
    );
  }
}
