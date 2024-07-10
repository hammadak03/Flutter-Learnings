import 'package:flutter/material.dart';
import 'package:flutter_navigation_and_routes/navigation/home_screen.dart';
import 'package:flutter_navigation_and_routes/navigation/screen_three.dart';
import 'package:flutter_navigation_and_routes/navigation/screen_two.dart';
import 'package:flutter_navigation_and_routes/routes/route_names.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.screenOne:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.screenTwo:
        return MaterialPageRoute(builder: (context) => ScreenTwo());
      case RouteNames.screenThree:
        return MaterialPageRoute(builder: (context) => ScreenThree());

      default:
        return MaterialPageRoute(builder: (context) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('No Route Defined'),
              ),
            ),
          );
        });
    }
  }
}
