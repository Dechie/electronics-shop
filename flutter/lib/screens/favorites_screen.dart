import 'package:flutter/material.dart';
import 'package:mobile_shop/screens/bottom_nav_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(parentContext: context),
      appBar: AppBar(),
      body: const SafeArea(
        child: SizedBox(
          child: Center(
            child: Text('Favorites Screen'),
          ),
        ),
      ),
    );
  }
}
