// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lectura.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lectura _$$_LecturaFromJson(Map<String, dynamic> json) => _$_Lectura(
      id: json['id'] as int,
      code: json['code'] as String,
      fecha: const DatetimeJsonConverter().fromJson(json['fecha'] as String),
      isOk: json['isOk'] as int,
    );

Map<String, dynamic> _$$_LecturaToJson(_$_Lectura instance) =>
    <String, dynamic>{
      'code': instance.code,
      'fecha': const DatetimeJsonConverter().toJson(instance.fecha),
      'isOk': instance.isOk,
    };
