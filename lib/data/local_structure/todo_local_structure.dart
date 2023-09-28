import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataStructure {
  const LocalDataStructure();
  static const tableKey = "todos";
  static late final Future<Database> database;

  static Future<void> init() async {
    String pathDirectory = await getDatabasesPath();
    String path = join(pathDirectory, tableKey);

    database = openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static Future<void> _onCreate(Database database, int version) async {
    return database.execute(
      '''CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT,
      eventName TEXT, 
      eventDescription TEXT, 
      eventLocation TEXT, 
      time TEXT,
      priorityColor INTEGER,
      taskDate TEXT ,
      remainder INTEGER)''',
    );
  }

  Future<void> insert({
    required Map<String, Object?> data,
  }) async {
    final db = await database;

    await db.insert(
      tableKey,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print(await readAll());
  }

  Future<void> update({
    required Map<String, Object?> data,
    required int id,
  }) async {
    final db = await database;
    await db.update(
      tableKey,
      data,
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<List<Map<String, Object?>>> readAll() async {
    final db = await database;
    return await db.query(tableKey);
  }

  Future<void> delete({
    required int id,
  }) async {
    final db = await database;

    db.delete(
      tableKey,
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<Map<String, Object?>> read({
    required int id,
  }) async {
    final db = await database;
    List<Map<String, Object?>> allTodos = await db.query(
      tableKey,
      where: "id=?",
      whereArgs: [id],
    );
    return allTodos[0];
  }

  Future<List<Map<String, Object?>>> readFilteredData(DateTime time) async {
    final db = await database;
    final year = time.year.toString();
    final month = time.month.toString().padLeft(2, "0");
    final day = time.day.toString().padLeft(2, "0");

    return await db
        .rawQuery("SELECT * FROM `todos`  WHERE `taskDate` LIKE '%$year-$month-$day%'");
  }
}
