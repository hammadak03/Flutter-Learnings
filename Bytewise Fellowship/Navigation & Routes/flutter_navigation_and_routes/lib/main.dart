import 'package:flutter/material.dart';

// when using routes, use these and comment out navigation imports
import 'package:flutter_navigation_and_routes/routes/home_screen.dart';
import 'package:flutter_navigation_and_routes/routes/screen_three.dart';
import 'package:flutter_navigation_and_routes/routes/screen_two.dart';
import 'package:flutter_navigation_and_routes/routes/route_names.dart';

//when using navigation, use these and comment out other folder
// import 'package:flutter_navigation_and_routes/navigation/home_screen.dart';
// import 'package:flutter_navigation_and_routes/navigation/screen_three.dart';
// import 'package:flutter_navigation_and_routes/navigation/screen_two.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Navigator and Routes',

      // home: HomeScreen(),

      //Named routes
      initialRoute: RouteNames.screenOne,
      routes: {
        RouteNames.screenOne: (context) => HomeScreen(),
        RouteNames.screenTwo: (context) => ScreenTwo(),
        RouteNames.screenThree: (context) => ScreenThree(),
      },
    ),
  );
}
