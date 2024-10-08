// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_firebase/screens/login_screen.dart';
import '../services/firestore_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();
  String _searchQuery = '';
  bool _isSearching = false; // To track if the search bar is active

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 5, 25, 70),
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true, // Automatically focus the search field
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.searchTasks,
                  hintStyle: TextStyle(color: Colors.white60),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
              )
            : Text(AppLocalizations.of(context)!.todos,
                style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchController.clear();
                  _searchQuery = '';
                }
                _isSearching = !_isSearching;
              });
            },
          ),
          IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterNewTask,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    if (_textController.text.isNotEmpty && user != null) {
                      await _firestoreService.addTodoItem(
                          user.uid, _textController.text);
                      _textController.clear();
                    }
                  },
                ),
              ),
              onSubmitted: (_) async {
                if (_textController.text.isNotEmpty && user != null) {
                  await _firestoreService.addTodoItem(
                      user.uid, _textController.text);
                  _textController.clear();
                }
              },
            ),
          ),
          Expanded(
            child: user == null
                ? Center(
                    child: Text(AppLocalizations.of(context)!.noUserLoggedIn))
                : _buildTodoList(user.uid),
          ),
        ],
      ),
    );
  }

  // Build the todo list using FirestoreService
  Widget _buildTodoList(String uid) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreService.getUserTodos(uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          if (kDebugMode) {
            print(snapshot.error);
          }
          return Center(
              child: Text(
                  '${AppLocalizations.of(context)!.error} ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
              child: Text(AppLocalizations.of(context)!.noTasksFound));
        }

        final todos = snapshot.data!.docs.where((doc) {
          final String task = doc['task'].toLowerCase();
          return task.contains(_searchQuery);
        }).toList();

        if (todos.isEmpty) {
          return Center(
              child: Text(AppLocalizations.of(context)!.noMatchingTasksFound));
        }

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            final String task = todo['task'];
            final bool isDone = todo['isDone'];

            return _buildTodoItem(todo.id, task, isDone);
          },
        );
      },
    );
  }

  // Build individual todo item
  Widget _buildTodoItem(String docId, String task, bool isDone) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ListTile(
        title: Text(
          task,
          style: TextStyle(
            fontSize: 18.0,
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                _textController.text = task;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(AppLocalizations.of(context)!.editTask),
                      content: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.enterYourTask),
                        onSubmitted: (_) async {
                          await _firestoreService.updateTodoItem(
                              docId, _textController.text);
                          _textController.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(AppLocalizations.of(context)!.cancel),
                          onPressed: () {
                            _textController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(AppLocalizations.of(context)!.save),
                          onPressed: () async {
                            await _firestoreService.updateTodoItem(
                                docId, _textController.text);
                            _textController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _firestoreService.deleteTodoItem(docId),
            ),
          ],
        ),
        onTap: () => _firestoreService.toggleTodoItem(docId, isDone),
      ),
    );
  }
}
