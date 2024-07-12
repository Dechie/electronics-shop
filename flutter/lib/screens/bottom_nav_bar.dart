import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/method_utils.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  final BuildContext parentContext;

  const BottomNavBar({
    super.key,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTap,
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
            Icons.favorite_border_outlined,
            color: mainRed,
          ),
          label: 'Favorites',
        ),
      ],
    );
  }

  void onTabTap(int index) {
    var enumValue = Pages.values[index];
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
