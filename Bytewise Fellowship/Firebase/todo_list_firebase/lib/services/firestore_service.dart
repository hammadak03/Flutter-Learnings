import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new todo item to Firestore
  Future<void> addTodoItem(String uid, String task) async {
    await _firestore.collection('todos').add({
      'uid': uid,
      'task': task,
      'isDone': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Update an existing todo item in Firestore
  Future<void> updateTodoItem(String docId, String newTask) async {
    await _firestore.collection('todos').doc(docId).update({
      'task': newTask,
    });
  }

  // Toggle a todo item's completion status
  Future<void> toggleTodoItem(String docId, bool isDone) async {
    await _firestore.collection('todos').doc(docId).update({
      'isDone': !isDone,
    });
  }

  // Delete a todo item from Firestore
  Future<void> deleteTodoItem(String docId) async {
    await _firestore.collection('todos').doc(docId).delete();
  }

  // Get a stream of todos for a specific user
  Stream<QuerySnapshot> getUserTodos(String uid) {
    return _firestore
        .collection('todos')
        .where('uid', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
