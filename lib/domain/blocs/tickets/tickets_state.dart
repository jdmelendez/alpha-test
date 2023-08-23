part of 'tickets_bloc.dart';

enum TicketsStatus { initialized, loading, loaded, failure }

@immutable
class TicketsState extends Equatable {
  List<Ticket> items;
  TicketsStatus status;
  String errorMessage;

  TicketsState({
    this.items = const [],
    this.status = TicketsStatus.initialized,
    this.errorMessage = "",
  });

  TicketsState copyWith({
    List<Ticket>? items,
    TicketsStatus? status,
    String? errorMessage,
  }) {
    return TicketsState(
      items: items ?? this.items,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [items, status, errorMessage];
}
