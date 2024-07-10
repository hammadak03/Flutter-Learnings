import 'package:flutter/material.dart';
import 'package:flutter_navigation_and_routes/routes/route_names.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Next Screen'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              onPressed: () {
                //pushNamed() used with named routes
                Navigator.pushNamed(context, RouteNames.screenTwo,
                    arguments: {'message': 'Hello Screen Two'});

                //pushNamedAndRemoveUntil()
                //push a new route and remove all the previous routes until
                //predicate returns true
                // Navigator.pushNamedAndRemoveUntil(context, RouteNames.screenTwo,
                //     (Route<dynamic> route) => false);

                //popAndPushNamed()
                //pops current route off the stack and pushed a new route
                // Navigator.popAndPushNamed(context, RouteNames.screenTwo);

                // pushReplacementNamed()
                //replace the current route with a new route.
                // Navigator.pushReplacementNamed(context, RouteNames.screenTwo);
              },
              child: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
