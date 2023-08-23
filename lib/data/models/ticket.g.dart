// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      id: json['id'] as int,
      code: json['code'] as String,
      state: json['state'] as int,
      fechaLectura: json['fechaLectura'] == null
          ? null
          : DateTime.parse(json['fechaLectura'] as String),
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'state': instance.state,
      'fechaLectura': instance.fechaLectura?.toIso8601String(),
    };
