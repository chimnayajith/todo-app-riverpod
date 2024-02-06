import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo_list.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE todo(
              id TEXT,
              title TEXT,
              description TEXT,
              dueDate TIMESTAMP,
              priority TEXT,
              isCompleted INTEGER DEFAULT 0,
              cardColor INTEGER,
              createdAt TIMESTAMP,
              updatedAt TIMESTAMP
            )''');
      },
    );
  }
}
