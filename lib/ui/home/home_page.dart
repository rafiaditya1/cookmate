import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/widget/category_card.dart';
import 'package:cookmate/ui/widget/recommend_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/account_circle.png'),
                  Text(
                    'Halo, \nRafi Aditya Seno Aji',
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Telusuri Resep Favorit Anda',
                style: orangeTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategori',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 13,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 16),
                  //   child: TextButton(
                  //     child: Text(
                  //       'Semua Kategori',
                  //       style: orangeTextStyle.copyWith(
                  //         fontWeight: light,
                  //         fontSize: 11,
                  //       ),
                  //     ),
                  //     onPressed: () {},
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(),
                    SizedBox(width: 16),
                    CategoryCard(),
                    SizedBox(width: 16),
                    CategoryCard(),
                    SizedBox(width: 16),
                    CategoryCard(),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Rekomendasi Resep',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  RecommendCard(),
                  RecommendCard(),
                  RecommendCard(),
                  RecommendCard(),
                  RecommendCard(),
                ],
              )
              // Container(
              //   height: 200,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       Container(
              //         width: 300,
              //         height: 200,
              //         child: Container(
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: Image.asset(
              //               'assets/food.jpeg',
              //               height: 300,
              //               width: 200,
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
