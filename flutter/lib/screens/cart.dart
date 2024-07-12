import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(parentContext: context),
      body: const SizedBox(
        child: Center(
          child: Text('cart screen'),
        ),
      ),
    );
  }
}
