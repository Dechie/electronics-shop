import 'package:flutter/material.dart';
import 'package:mobile_shop/constants.dart';

import 'screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainRed,
      ),
      home: MainPage(),
    );
  }
}
