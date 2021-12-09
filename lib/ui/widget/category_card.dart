import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 210,
        width: 138,
        color: lightGreyColor,
        child: Column(
          children: [
            Image.asset(
              'assets/nasgor.jpeg',
              width: 138,
              height: 160,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 11),
            Text(
              'Masakkan Hari Raya',
              style: blackTextStyle.copyWith(
                fontSize: 10,
                fontWeight: bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
