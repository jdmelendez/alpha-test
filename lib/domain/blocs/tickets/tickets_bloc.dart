import 'dart:async';

import 'package:alpha_test/data/sqlite/database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:meta/meta.dart";

import '../../../data/dao/ticket_dao.dart';
import '../../../data/models/ticket.dart';
import '../../../data/repositories/tickets_repository.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

// class TicketsBloc extends HydratedBloc<TicketsEvent, TicketsState> {
class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final TicketsRepository ticketsRepository;

  TicketsBloc({required this.ticketsRepository}) : super(TicketsState()) {
    on<TicketsLoad>((event, emit) async {
      try {
        // Se obtiene los tickets de la api
        List<Ticket> items = await ticketsRepository.getAll();

        // Se almacenan en una base de datos local
        await ticketsRepository.insertAll_LocalDB(items);

        emit(TicketsState(items: items, status: TicketsStatus.loaded));
      } catch (e) {}
    });

    on<TicketsUpdate>((event, emit) async {
      try {
        await ticketsRepository.update_LocalDB(event.item);

        // Se almacenan en una base de datos local

        // emit(TicketsState(items: items, status: TicketsStatus.loaded));
      } catch (e) {}
    });

    @override
    void dispose() {}
  }
}
