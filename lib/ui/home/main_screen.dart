import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/favorite/favorite_page.dart';
import 'package:cookmate/ui/search/search_page.dart';
import 'package:cookmate/ui/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  // int _currentIndex = 0;

  // final tabs = [
  //   HomePage(),
  //   SearchPage(),
  //   FavoritePage(),
  // ];

  List<Widget> _listWidget = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline_rounded),
      label: 'Favorite',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: orangeColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: _bottomNavBarItems),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
