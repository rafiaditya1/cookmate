import 'package:cookmate/data/model/detail_recipe.dart';
import 'package:cookmate/provider/recipe_provider.dart';
import 'package:cookmate/ui/widget/recommend_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<RecipeProvider>(
    //   create: (_) => RecipeProvider(context),
    //   child: Scaffold(
    //     body: SafeArea(
    //       child: Consumer<RecipeProvider>(builder: (context, state, _) {
    //         if (state.state == ResultState.loading) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         } else if (state.state == ResultState.hasData) {
    //           return Stack(
    //             children: [
    //               ListView.builder(
    //                 itemCount: state.result.results.length,
    //                 itemBuilder: (context, index) {
    //                   return RecommendCard(
    //                     title: state.result.results[index],
    //                     thumb: state.result.results[index],
    //                     times: state.result.results[index],
    //                     portion: state.result.results[index],
    //                   );
    //                 },
    //               )
    //             ],
    //           );
    //         } else {
    //           return Center(
    //             child: Text(''),
    //           );
    //         }
    //       }),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Container(),
    );
  }
}
