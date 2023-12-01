import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../all_tasks.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dbTask.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tbl_tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        isDone INTEGER
      )
    ''');
  }

  Future<int> insertTask(TaskModel task) async {
    Database db = await instance.database;
    return await db.insert('tbl_tasks', task.toMap());
  }

  Future<List<TaskModel>> getAllTasks() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('tbl_tasks');
    return List.generate(maps.length, (index) {
      return TaskModel.fromMap(maps[index]);
    });
  }

  Future<int> updateTask(TaskModel task) async {
    Database db = await instance.database;
    return await db.update('tbl_tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    Database db = await instance.database;
    return await db.delete('tbl_tasks', where: 'id = ?', whereArgs: [id]);
  }
}
