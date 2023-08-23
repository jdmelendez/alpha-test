import 'package:alpha_test/data/repositories/lecturas_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:meta/meta.dart";
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../data/models/lectura.dart';
import '../../../../data/models/ticket.dart';
import '../../../../data/repositories/tickets_repository.dart';

part 'scaner_event.dart';
part 'scaner_state.dart';

// class ScanerBloc extends HydratedBloc<ScanerEvent, ScanerState> {
class ScanerBloc extends Bloc<ScanerEvent, ScanerState> {
  final TicketsRepository ticketsRepository;
  final LecturasRepository lecturasRepository;

  ScanerBloc(
      {required this.ticketsRepository, required this.lecturasRepository})
      : super(ScanerState()) {
    on<ScanerReset>((event, emit) async {
      emit(ScanerState(status: ScanerStatus.isNoOK));
    });

    on<ScanerRead>((event, emit) async {
      try {
        // Se obtiene el ticket de la base de datos local
        Ticket? ticket = await ticketsRepository.get_ByCode_LocalDB(event.code);

        // Si existe se actualiza su estado en el caso de que este sea 0 y se emite el resultado
        bool isOK = false;

        if (ticket != null) {
          isOK = ticket.state == 0;

          if (isOK) {
            await ticketsRepository.update_LocalDB(ticket.copyWith(state: 1));
          }

          emit(ScanerState(
              status: isOK ? ScanerStatus.isOk : ScanerStatus.isNoOK));
        }

        // Se registra la lectura
        lecturasRepository.insert_LocalDB(Lectura(
            code: event.code,
            fecha: DateTime.now(),
            isOk: isOK ? 1 : 0,
            id: 1));
      } catch (e) {}
    }, transformer: sequential());

    @override
    void dispose() {}
  }
}
