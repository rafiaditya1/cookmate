import 'package:cookmate/provider/detail_category_list_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:cookmate/ui/widget/category_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatelessWidget {
  static const routeName = '/category_detail';
  final String id;
  const CategoryDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailCategoryListProvider>(
      create: (_) => DetailCategoryListProvider(context, id: id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            id,
            style: orangeTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: orangeColor,
            ),
          ),
          backgroundColor: whiteColor,
        ),
        body: Container(
          // height: 125,
          child: Consumer<DetailCategoryListProvider>(
              builder: (context, state, _) {
            if (state.state == ResultStateDetailCategory.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.results.length,
                itemBuilder: (context, index) {
                  final response = state.result.results[index];
                  return CategoryDetailCard(
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
            } else if (state.state == ResultStateDetailCategory.noData) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultStateDetailCategory.error) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultStateDetailCategory.noConnection) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(''),
              );
            }
          }),
        ),
      ),
    );
  }
}
