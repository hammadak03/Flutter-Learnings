import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    // final arguements = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Second Screen says: ${arguements['message']}'),
            // const SizedBox(
            //   height: 20,
            // ),
            const Text('Previous Screen'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}
