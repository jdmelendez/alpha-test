import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/ticket.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  static Database? _database;
  static const _dbName = 'tickets2.db';
  static const ticketsTable = 'tickets';
  static const lecturasTable = 'lecturas';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, _dbName);
    var database = await openDatabase(path,
        version: 2, onCreate: _initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  Future<void> _initDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $ticketsTable(
        id INTEGER PRIMARY KEY,
        code TEXT,
        state INTEGER
      )''');
    await db.execute('''
       CREATE TABLE $lecturasTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        code TEXT,
        isOk INTEGER,    
        fecha TEXT       
      )''');
  }
}
