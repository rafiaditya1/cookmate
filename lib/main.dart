import 'package:cookmate/ui/detail/category_detail.dart';
import 'package:cookmate/ui/home/home_page.dart';
import 'package:cookmate/ui/login/first_page.dart';
import 'package:cookmate/ui/login/login_page.dart';
import 'package:cookmate/ui/login/register_page.dart';
import 'package:flutter/material.dart';

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
        HomePage.routeName: (context) => const HomePage(),
        CategoryDetail.routeName: (context) => const CategoryDetail(),
      },
    );
  }
}
