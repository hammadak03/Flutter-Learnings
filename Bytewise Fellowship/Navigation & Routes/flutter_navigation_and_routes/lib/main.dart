import 'package:flutter/material.dart';
import 'package:flutter_navigation_and_routes/home_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Navigator and Routes',

      home: HomeScreen(),

      //Named routes
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/screenTwo': (context) => ScreenTwo(),
      //   '/screenThree': (context) => const ScreenThree(),
      // },
    ),
  );
}
