import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../utils/constants.dart';
import '../utils/method_utils.dart';

class BottomNavBar extends StatelessWidget {
  final BuildContext parentContext;

  int _currentIndex = 0;
  BottomNavBar({
    super.key,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTap,
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: mainredMoreBlacked,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: mainredMoreBlacked,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
            color: mainredMoreBlacked,
          ),
          label: 'Favorites',
        ),
      ],
    );
  }

  void onTabTap(int index) {
    var enumValue = Pages.values[index];
    _currentIndex = index;
    Widget navTo = targetScreen(enumValue);
    navigate(parentContext, navTo);
  }

  Widget targetScreen(Pages page) => switch (page) {
        Pages.home => const HomeScreen(),
        Pages.cart => const CartScreen(),
        Pages.favorites => const FavoritesScreen(),
      };
}

enum Pages { home, cart, favorites }
