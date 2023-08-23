import 'package:dio/dio.dart';

import '../dao/lectura_dao.dart';

import '../models/lectura.dart';

class LecturasRepository {
  final lecturaDAO = LecturaDao();

  Future<List<Lectura>> getAll_LocalDB() async {
    try {
      return await lecturaDAO.getLecturas();
    } on DioException {
      rethrow;
    }
  }

  insert_LocalDB(Lectura item) async {
    try {
      await lecturaDAO.insertLectura(item);
    } on Error {
      rethrow;
    }
  }
}
