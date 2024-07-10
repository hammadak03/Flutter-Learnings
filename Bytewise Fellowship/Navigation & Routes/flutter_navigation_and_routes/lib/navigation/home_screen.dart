import 'package:flutter/material.dart';
import 'package:flutter_navigation_and_routes/navigation/screen_two.dart';

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
                //push() is not used with named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenTwo(
                      data: 'My name is Hammad',
                    ),
                  ),
                );

                //pushAndRemoveUntil()
                //push a new route and remove all the previous routes until
                //predicate returns true
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => const ScreenTwo()),
                //     (Route<dynamic> route) => false);

                // pushReplacement()
                //replace the current route with a new route.
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ScreenTwo()),
                // );
              },
              child: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
