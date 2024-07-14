import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_tolist');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDatabase,
    );
    return database;
  }

  _onCreateDatabase(Database database, int version) async {
    await database.execute('''
    CREATE TABLE categories(
      id INTEGET PRIMARY KEY,
      name TEXT, 
      description TEXT
    )
    ''');
  }
}
