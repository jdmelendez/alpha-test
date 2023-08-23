import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../models/ticket.dart';
import '../sqlite/database.dart';

class TicketDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<void> insertTickets(List<Ticket> tickets) async {
    final db = await dbProvider.database;
    await db.transaction((txn) async {
      final batch = txn.batch();
      for (Ticket ticket in tickets) {
        batch.insert(DatabaseProvider.ticketsTable, ticket.toJson(),
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }
      await batch.commit();
    });
  }

  //Get All Ticket items
  Future<List<Ticket>> getTickets() async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseProvider.ticketsTable);

    return List.generate(maps.length, (index) {
      return Ticket.fromJson(maps[index]);
    });
  }

  Future<List<Ticket>> getTicket_byCode(String code) async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseProvider.ticketsTable, where: "code = '$code'");

    return List.generate(maps.length, (index) {
      return Ticket.fromJson(maps[index]);
    });
  }

  //Update Ticket record
  Future<int> updateTicket(Ticket ticket) async {
    final db = await dbProvider.database;

    return await db.update(
      DatabaseProvider.ticketsTable,
      ticket.toJson(),
      where: 'id = ?',
      whereArgs: [ticket.id],
    );
  }
}
