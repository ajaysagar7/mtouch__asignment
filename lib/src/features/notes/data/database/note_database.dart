import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notesss.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY,
        title TEXT,
        category TEXT,
        dateTime TEXT
      )
    ''');

  }





   Future<int> inserNote(NoteModel note) async {
    Database db = await instance.db;
    int value = await db.insert('notes', note.toMap());
    return value;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    Database db = await instance.db;
    return await db.query('notes');
  }

  
  }