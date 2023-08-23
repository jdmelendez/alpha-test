import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:meta/meta.dart";

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
        emit(TicketsState(status: TicketsStatus.loading));
        List<Ticket> items = await ticketsRepository.getAll();
        emit(TicketsState(items: items, status: TicketsStatus.loaded));
      } catch (e) {}
    });

    @override
    void dispose() {}
  }
}
