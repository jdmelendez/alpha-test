part of 'tickets_bloc.dart';

enum TicketsStatus { initialized, loading, loaded, failure }

@immutable
class TicketsState extends Equatable {
  List<Ticket> items;
  TicketsStatus status;
  String errorMessage;
  int offset;
  int limit;
  bool isLastPage;

  TicketsState({
    this.items = const [],
    this.limit = 10,
    this.offset = 0,
    this.status = TicketsStatus.initialized,
    this.isLastPage = false,
    this.errorMessage = "",
  });

  TicketsState copyWith(
      {List<Ticket>? items,
      TicketsStatus? status,
      String? errorMessage,
      int? offset,
      int? limit,
      bool? isLastPage}) {
    return TicketsState(
      items: items ?? this.items,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }

  @override
  List<Object?> get props =>
      [items, status, errorMessage, offset, limit, isLastPage];
}
