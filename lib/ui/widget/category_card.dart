import 'package:cookmate/data/model/category.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Result category;
  final Function() onPressed;

  const CategoryCard({required this.onPressed, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 200,
                color: orangeColor,
                child: Center(
                  child: Text(
                    category.category,
                    style: whiteTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
