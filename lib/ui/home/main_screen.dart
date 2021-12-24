import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/favorite/favorite_page.dart';
import 'package:cookmate/ui/widget/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';

  final String name;

  const MainScreen({Key? key, required this.name}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState(name: name);
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;

  late final String name;

  _MainScreenState({required this.name});

  late final List<Widget> _listWidget = [
    HomePage(name: name),
    // SearchPage(),
    const FavoritePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.search),
    // ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline_rounded),
      label: '',
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
