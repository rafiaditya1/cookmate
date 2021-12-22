import 'package:cookmate/provider/category_list_provider.dart';
import 'package:cookmate/provider/recommend_list_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/detail/category_detail.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:cookmate/ui/search/search_page.dart';
import 'package:cookmate/ui/widget/category_card.dart';
import 'package:cookmate/ui/widget/recommend_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  final String name;

  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(name: name);
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final String name;
  _HomePageState({required this.name});

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
        appBar: AppBar(
          title: Image.asset(
            'assets/logo_cookmate_01.png',
            height: 30,
            fit: BoxFit.cover,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.routeName);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.orange,
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset('assets/account_circle.png'),
                    Text(
                      'Halo, \n${name}',
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                        fontWeight: semiBold,
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
                    fontWeight: semiBold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                Consumer<RecommendListProvider>(builder: (context, state, _) {
                  if (state.state == ResultStateRecommend.HasData) {
                    return ListView.builder(
                      // scrollDirection: Axis.vertical,
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
