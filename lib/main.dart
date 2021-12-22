import 'package:cookmate/ui/detail/category_detail.dart';
import 'package:cookmate/ui/detail/recipe_detail.dart';
import 'package:cookmate/ui/home/home_page.dart';
import 'package:cookmate/ui/login/first_page.dart';
import 'package:cookmate/ui/login/login_page.dart';
import 'package:cookmate/ui/login/register_page.dart';
import 'package:cookmate/ui/search/search_page.dart';
import 'package:flutter/material.dart';

import 'ui/home/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirstPage.routeName,
      routes: {
        FirstPage.routeName: (context) => const FirstPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(
              name: '',
            ),
        CategoryDetail.routeName: (context) => CategoryDetail(
              id: ModalRoute.of(context)?.settings.arguments as String,
            ),
        RecipeDetail.routeName: (context) => RecipeDetail(
              id: ModalRoute.of(context)?.settings.arguments as String,
            ),
        // HomePage.routeName: (context) => const HomePage(name: ''),
        // CategoryDetail.routeName: (context) => const CategoryDetail(),
        // RecipeDetail.routeName: (context) => const RecipeDetail(),
        MainScreen.routeName: (context) => const MainScreen(
              name: '',
            ),
        SearchPage.routeName: (context) => SearchPage(),
      },
    );
  }
}
