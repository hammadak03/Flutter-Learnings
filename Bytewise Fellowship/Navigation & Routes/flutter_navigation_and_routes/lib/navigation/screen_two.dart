import 'package:flutter/material.dart';
import 'package:flutter_navigation_and_routes/navigation/screen_three.dart';

class ScreenTwo extends StatelessWidget {
  final String? data;
  ScreenTwo({this.data, super.key});
  @override
  Widget build(BuildContext context) {
    // recieve arguements from previous screen/route
    // final arguements = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('First Screen says ${data ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            const Text('Next Screen'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenThree()),
                );

                //using named route
                // Navigator.pushNamed(context, '/screenThree');
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Previous Screen'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              onPressed: () {
                Navigator.pop(context);
                ;
              },
              child: const Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}
