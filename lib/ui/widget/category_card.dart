import 'package:cookmate/data/model/category.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  final Result category;
  final Function() onPressed;

  const CategoryCard(
      {required this.onPressed,
        required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            height: 50,
            width: 10,
            color: orangeColor,
            child: Column(
              children: [
            // Image.asset(
            //   'assets/nasgor.jpeg',
            //   width: 138,
            //   height: 160,
            //   fit: BoxFit.cover,
            // ),
                const SizedBox(height: 15),
                Text(
                  category.category,
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}