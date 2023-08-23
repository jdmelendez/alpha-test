import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'lectura.freezed.dart';
part 'lectura.g.dart';

Lectura lecturaFromJson(String str) => Lectura.fromJson(json.decode(str));

String lecturaToJson(Lectura data) => json.encode(data.toJson());

@freezed
class Lectura with _$Lectura {
  const factory Lectura({
    @JsonKey(includeToJson: false) required int id,
    required String code,
    @DatetimeJsonConverter() required DateTime fecha,
    required int isOk,
  }) = _Lectura;

  factory Lectura.fromJson(Map<String, dynamic> json) =>
      _$LecturaFromJson(json);
}

class DatetimeJsonConverter extends JsonConverter<DateTime, String> {
  const DatetimeJsonConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
