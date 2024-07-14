import 'package:flutter/material.dart';
import 'package:todo_list_project/screens/categories_screen.dart';
import 'package:todo_list_project/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              currentAccountPicture: Icon(
                Icons.person_outline_rounded,
              ),
              accountName: Text('Hammad Ahmed'),
              accountEmail: Text('hammadak350@gmail.com'),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Categories'),
              leading: const Icon(Icons.view_list),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
