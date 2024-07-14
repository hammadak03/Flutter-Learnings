import 'package:flutter/material.dart';
import 'package:todo_list_project/helpers/drawer_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'To-do List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const DrawerNavigation(),
    );
  }
}
