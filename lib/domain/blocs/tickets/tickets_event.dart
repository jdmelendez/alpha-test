part of 'tickets_bloc.dart';

abstract class TicketsEvent extends Equatable {
  const TicketsEvent();

  @override
  List<Object> get props => [];
}

class TicketsLoad extends TicketsEvent {
  const TicketsLoad();
}

class TicketsUpdate extends TicketsEvent {
  final Ticket item;

  const TicketsUpdate({required this.item});
}
