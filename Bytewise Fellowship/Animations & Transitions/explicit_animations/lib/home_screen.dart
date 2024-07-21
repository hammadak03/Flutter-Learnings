import 'second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 29, 89),
      ),
      body: Column(
        children: [
          ListTile(
            trailing: const Hero(
              tag: 'tag-1',
              child: Icon(Icons.person),
            ),
            title: const Text('Click Me'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
