import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required int id,
    required String code,
    required int state,
    DateTime? fechaLectura,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
