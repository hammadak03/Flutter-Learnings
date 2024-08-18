import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_firebase/screens/login_screen.dart';
import '../services/firestore_service.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _textController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('TODOs', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 5, 25, 70),
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter a new task',
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
                ? const Center(child: Text('No user logged in'))
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
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No tasks found.'));
        }

        final todos = snapshot.data!.docs;

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
                      title: const Text('Edit Task'),
                      content: TextField(
                        controller: _textController,
                        decoration:
                            const InputDecoration(hintText: 'Enter your task'),
                        onSubmitted: (_) async {
                          await _firestoreService.updateTodoItem(
                              docId, _textController.text);
                          _textController.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            _textController.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Save'),
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
