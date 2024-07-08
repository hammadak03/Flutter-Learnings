import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold app ka basic layout structure provide karta hai
      appBar: AppBar(
        // AppBar top horizontal bar hai
        title: const Text('AppBar'),
        // App bar ka title, jo aksar text hota hai
        backgroundColor: Colors.amber,
        // App bar ka background color
        centerTitle: true,
        // Title ko app bar mein center karta hai
        actions: [
          // Actions se app bar ke left par widgets (jaise buttons) add kiye ja sakte hain
          ElevatedButton(
            //ek raised button
            onPressed: () {},
            // onPressed callback hai jab button press kiya jaye
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            // Button ka style app bar ke color se match karta hai
            child: const Icon(Icons.search),
            // Button par dikhne wala icon
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // BottomNavigationBar app ke mukhtalif sections ke darmiyan navigation allow karta hai
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // Home icon ke sath label
          BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Exit')
          // Exit icon ke sath label
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // FloatingActionButton gol button hai jo content par hover karta hai
        onPressed: () {},
        // onPressed callback hai jab button press kiya jaye
        child: const Icon(Icons.add),
        // Button par dikhne wala icon
      ),
      drawer: const Drawer(
          // Drawer ek hidden side panel hai jo swipe karne ya icon ke zariye open hota hai
          ),
      body: const Center(
        // Center widget apne child ko apne andar center karta hai
        child: Text('this is the body of Scaffold'),
        // Body mein dikhne wala text
      ),
      backgroundColor: const Color.fromARGB(255, 220, 214, 184),
      // Scaffold ka background color
    );
  }
}
