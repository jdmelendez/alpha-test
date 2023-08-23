import 'dart:async';

import 'package:alpha_test/data/sqlite/database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:meta/meta.dart";

import '../../../data/dao/ticket_dao.dart';
import '../../../data/models/lectura.dart';
import '../../../data/models/ticket.dart';
import '../../../data/repositories/lecturas_repository.dart';
import '../../../data/repositories/lecturas_repository.dart';

part 'lecturas_event.dart';
part 'lecturas_state.dart';

// class LecturasBloc extends HydratedBloc<LecturasEvent, LecturasState> {
class LecturasBloc extends Bloc<LecturasEvent, LecturasState> {
  final LecturasRepository lecturasRepository;

  LecturasBloc({required this.lecturasRepository}) : super(LecturasState()) {
    on<LecturasLoad>((event, emit) async {
      try {
        emit(LecturasState(status: LecturasStatus.loading));

        // Se obtiene los lecturas de BD local
        List<Lectura> items = await lecturasRepository.getAll_LocalDB();

        emit(LecturasState(items: items, status: LecturasStatus.loaded));
      } catch (e) {
        emit(LecturasState(items: [], status: LecturasStatus.failure));
      }
    });

    @override
    void dispose() {}
  }
}
