import 'package:flutter/material.dart';
import 'package:mobile_shop/screens/cart.dart';

import '../constants.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final _childScreens = <Widget>[
    const HomeScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGrey,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTap,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: mainRed,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: mainRed,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: mainRed,
            ),
            label: 'Me',
          ),
        ],
      ),
      body: _childScreens[_currentIndex],
    );
  }

  void onTabTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
