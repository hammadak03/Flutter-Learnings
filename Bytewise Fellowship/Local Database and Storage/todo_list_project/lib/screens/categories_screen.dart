import 'package:flutter/material.dart';
import 'package:todo_list_project/screens/home_screen.dart';
import 'package:todo_list_project/services/category_service.dart';
import '../models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  _category.name = _categoryController.text;
                  _category.description = _descriptionController.text;
                  _categoryService.saveCategory(_category);
                  var result = await _categoryService.saveCategory(_category);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            title: const Text('Categories Form'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                        hintText: 'Write a category', labelText: 'Category'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Write a description',
                        labelText: 'Description'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('abcd'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
