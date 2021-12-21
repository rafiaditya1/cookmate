import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: Text("search page"),
      ),
    );
  }
}
