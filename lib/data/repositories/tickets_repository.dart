import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../dio/dio_client.dart';
import '../endpoints/endpoints.dart';
import '../models/ticket.dart';
import 'base_repository.dart';

class TicketsRepository implements BaseRepository<Ticket> {
  final endpoint = Endpoints.tickets;

  @override
  Future<void> add(Ticket item) async {}

  @override
  Future<void> delete(Ticket item) async {}

  @override
  Future<List<Ticket>> getAll() async {
    try {
      final Response response = await DioClient.get(endpoint);
      return List<Ticket>.from(
          response.data["tickets"].map((e) => Ticket.fromJson(e)));
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Ticket?> get(int id) async {
    // Leer el contenido del archivo JSON desde assets
    // final jsonString = await rootBundle.loadString('assets/data/items.json');
    // final List<dynamic> jsonList = json.decode(jsonString);

    // // Mapear la lista de objetos JSON a objetos Tarea
    // final List<Tarea> items = jsonList.map((json) {
    //   return Tarea.fromJson(json);
    // }).toList();
    // return items.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> update(Ticket item) async {}
}
