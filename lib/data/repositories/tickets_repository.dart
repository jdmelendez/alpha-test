import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../dao/ticket_dao.dart';
import '../dio/dio_client.dart';
import '../endpoints/endpoints.dart';
import '../models/ticket.dart';

class TicketsRepository {
  final endpoint = Endpoints.tickets;
  final ticketDAO = TicketDao();

  Future<List<Ticket>> getAll() async {
    try {
      final Response response = await DioClient.get(endpoint);
      return List<Ticket>.from(
          response.data["tickets"].map((e) => Ticket.fromJson(e)));
    } on DioException {
      rethrow;
    }
  }

  ///
  /// LOCAL DB
  ///

  Future<List<Ticket>> getAll_LocalDB() async {
    try {
      return await ticketDAO.getTickets();
    } on DioException {
      rethrow;
    }
  }

  Future<Ticket?> get_ByCode_LocalDB(String code) async {
    try {
      final List<Ticket> tickets = await ticketDAO.getTicket_byCode(code);
      return tickets.isNotEmpty ? tickets.first : null;
    } on DioException {
      rethrow;
    }
  }

  insertAll_LocalDB(List<Ticket> items) async {
    try {
      await ticketDAO.insertTickets(items);
    } on Error {
      rethrow;
    }
  }

  update_LocalDB(Ticket item) async {
    try {
      await ticketDAO.updateTicket(item);
    } on Error {
      rethrow;
    }
  }
}
