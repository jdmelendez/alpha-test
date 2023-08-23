import 'dart:async';

import '../models/lectura.dart';
import '../models/ticket.dart';
import '../sqlite/database.dart';

class LecturaDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Get All Lectura items
  Future<List<Lectura>> getLecturas() async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseProvider.lecturasTable);

    return List.generate(maps.length, (index) {
      return Lectura.fromJson(maps[index]);
    });
  }

  //Insert Lectura record
  Future<int> insertLectura(Lectura ticket) async {
    final db = await dbProvider.database;

    return await db.insert(
      DatabaseProvider.lecturasTable,
      ticket.toJson(),
    );
  }
}
