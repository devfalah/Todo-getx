import 'package:sqflite/sqflite.dart';
import 'package:todo_getx/app/data/models/task.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper db = DBHelper._();
  static Database? _database;
  static const String _tableName = 'tasks';
  static const int _version = 1;

  Future<Database?> get database async {
    if (_database != null) return _database;

    return _database = await initDb();
  }

  Future<Database> initDb() async {
    var _path = await getDatabasesPath() + 'task.db';
    return openDatabase(_path, version: _version,
        onCreate: (Database db, int version) async {
      return db.execute(
        'CREATE TABLE $_tableName('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'title STRING, note TEXT, date STRING, '
        'startTime STRING, endTime STRING, '
        'remind INTEGER, repeat STRING, '
        'color INTEGER, '
        'isCompleted BOOLEAN)',
      );
    });
  }

  Future<int> insert(Task task) async {
    final dbClient = await database;
    return await dbClient!.insert(_tableName, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> delete(Task task) async {
    final dbClient = await database;

    return await dbClient!
        .delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  Future<List<Map<String, Object?>>> query() async {
    final dbClient = await database;

    return await dbClient!.query(_tableName);
  }

  Future<List<Task>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await query();
    var list =
        maps.isNotEmpty ? maps.map((task) => Task.fromMap(task)).toList() : [];
    return list as List<Task>;
  }

  Future<int> update(int id) async {
    final dbClient = await database;

    return await dbClient!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
   ''', [true, id]);
  }
}
