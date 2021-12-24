import 'package:cookmate/provider/recipe_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/search/recipe_item.dart';
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
    return ChangeNotifierProvider<RecipeProvider>(
      create: (_) => RecipeProvider(context),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<RecipeProvider>(builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == ResultState.hasData) {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: state.result.results.length,
                    itemBuilder: (context, index) {
                      return RecipeItem(
                        resep: state.result.results[index],
                      );
                    },
                    padding: const EdgeInsets.only(top: kToolbarHeight + 24),
                    shrinkWrap: true,
                  ),
                  _searchAppBar(context, state)
                ],
              );
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultState.noConnection) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: greyTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        state.refresh();
                      },
                      child: const Text('Refresh'),
                    )
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

  Container _searchAppBar(BuildContext context, RecipeProvider state) {
    return Container(
      height: kToolbarHeight + 20,
      padding: const EdgeInsets.only(top: 25),
      color: orangeColor,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: _textSearch,
        textInputAction: TextInputAction.search,
        style: whiteTextStyle.copyWith(),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: whiteColor,
          ),
          hintText: 'Search Recipe',
          hintStyle: whiteTextStyle.copyWith(
            fontWeight: light,
          ),
        ),
        onSubmitted: (value) {
          state.setQuery(value);
        },
      ),
    );
  }

  @override
  void dispose() {
    _textSearch.dispose();
    super.dispose();
  }
}
