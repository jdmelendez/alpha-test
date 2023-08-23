part of 'lecturas_bloc.dart';

enum LecturasStatus { initialized, loading, loaded, failure }

@immutable
class LecturasState extends Equatable {
  List<Lectura> items;
  LecturasStatus status;
  String errorMessage;

  LecturasState({
    this.items = const [],
    this.status = LecturasStatus.initialized,
    this.errorMessage = "",
  });

  LecturasState copyWith(
      {List<Lectura>? items,
      LecturasStatus? status,
      String? errorMessage,
      int? offset,
      int? limit,
      bool? isLastPage}) {
    return LecturasState(
      items: items ?? this.items,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        items,
        status,
        errorMessage,
      ];
}
