import 'package:sqflite/sqflite.dart';
import 'package:todo_list_project/repositories/database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;

  Repository() {
    // initialize database connection
    _databaseConnection = DatabaseConnection();
  }
  static late Database _database;
  Future<Database> get database async {
    // check if database exists or not
    if (_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  // inserting data to table
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }
}
