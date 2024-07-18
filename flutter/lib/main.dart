import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/models/mobile.dart';
import 'package:mobile_shop/screens/auth/register.dart';
import 'package:mobile_shop/screens/detail-screen/detail_screen.dart';
import 'package:mobile_shop/utils/constants.dart';

import 'screens/home_screen.dart';

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
    var mobilee = Mobile(
      title: "m1",
      image: "s8.jpg",
      ram: 8,
      storage: 9,
      cameraFront: 10,
      cameraBack: 11,
      battery: 12,
      price: 12000,
    );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainRed,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      //home: const MainPage(),
      //home: const HomeScreen(),
      //home: const LoginScreen(),
      initialRoute: '/',
      routes: {
        "/": (context) => const HomeScreen(),
        "/product-detail": (context) => DetailScreen(product: mobilee),
        "/register": (context) => const RegisterScreen(),
      },
    );
  }
}
