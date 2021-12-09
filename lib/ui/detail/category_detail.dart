import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/widget/category_detail_card.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  static const routeName = '/category_detail';

  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masakkan Hari Raya',
          style: orangeTextStyle.copyWith(
            fontWeight: bold,
          ),
        ),
        backgroundColor: whiteColor,
      ),
      body: Container(
        // height: 125,
        child: ListView(
          children: [
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
            CategoryDetailCard(),
          ],
        ),
      ),
    );
  }
}
