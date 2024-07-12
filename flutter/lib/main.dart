import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/screens/home_screen.dart';
import 'package:mobile_shop/utils/constants.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainRed,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      //home: const MainPage(),
      home: const HomeScreen(),
    );
  }
}
