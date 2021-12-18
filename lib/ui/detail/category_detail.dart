import 'package:cookmate/provider/detail_recipe_list_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/widget/category_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatelessWidget {
  static const routeName = '/category_detail';

  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailCategoryListProvider>(
    create: (_) => DetailCategoryListProvider(context),
      child : Scaffold(
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
        child: Consumer<DetailCategoryListProvider>(builder: (context, state, _) {
          if (state.state == ResultStateDetailCategory.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.results.length,
              itemBuilder: (context, index) {
                return CategoryDetailCard(
                  title: state.result.results[index],
                  thumb: state.result.results[index],
                  times: state.result.results[index],
                  portion: state.result.results[index],
                );
              },
            );
          } else if (state.state == ResultStateDetailCategory.NoData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultStateDetailCategory.Error) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultStateDetailCategory.NoConnection) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 25),
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
