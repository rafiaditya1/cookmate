import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/detail/category_detail.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CategoryDetail.routeName);
        },
        child: Container(
          height: 210,
          width: 138,
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
                'Masakkan Hari Raya',
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
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
