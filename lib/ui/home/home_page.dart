import 'package:cookmate/provider/category_list_provider.dart';
import 'package:cookmate/provider/recommend_list_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/detail/category_detail.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:cookmate/ui/widget/category_card.dart';
import 'package:cookmate/ui/widget/recommend_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryListProvider>(
          create: (_) => CategoryListProvider(context),
        ),
        ChangeNotifierProvider<RecommendListProvider>(
            create: (_) => RecommendListProvider(context))
      ],
      child: Scaffold(
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
                const SizedBox(height: 25),
                Text(
                  'Telusuri Resep Favorit Anda',
                  style: orangeTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
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
                  ],
                ),
                const SizedBox(height: 16),
                Consumer<CategoryListProvider>(builder: (context, state, _) {
                  if (state.state == ResultState.HasData) {
                    return Container(
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.result.results.length,
                        itemBuilder: (context, index) {
                          final response = state.result.results[index];
                          return CategoryCard(
                            category: state.result.results[index],
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                CategoryDetail.routeName,
                                arguments: response.key,
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else if (state.state == ResultState.NoData) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state.state == ResultState.Error) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state.state == ResultState.NoConnection) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                            style:
                                TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(''),
                    );
                  }
                }),
                const SizedBox(height: 30),
                Text(
                  'Rekomendasi Resep',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                Consumer<RecommendListProvider>(builder: (context, state, _) {
                  if (state.state == ResultStateRecommend.HasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.result.results.length,
                      itemBuilder: (context, index) {
                        final response = state.result.results[index];
                        return RecommendCard(
                          title: state.result.results[index],
                          thumb: state.result.results[index],
                          times: state.result.results[index],
                          portion: state.result.results[index],
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RecipeDetail.routeName,
                              arguments: response.key,
                            );
                          },
                        );
                      },
                    );
                  } else if (state.state == ResultStateRecommend.NoData) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state.state == ResultStateRecommend.Error) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state.state == ResultStateRecommend.NoConnection) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                            style:
                                TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(''),
                    );
                  }
                }),
                /*Column(
                children: const [
                  RecommendCard(),
                  RecommendCard(),
                  RecommendCard(),
                  RecommendCard(),
                  RecommendCard(),
                ],
              )*/
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
      ),
    );
  }
}
