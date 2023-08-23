part of 'scaner_bloc.dart';

enum ScanerStatus {
  isOk,
  isNoOK,
}

@immutable
class ScanerState extends Equatable {
  ScanerStatus status;
  String errorMessage;

  ScanerState({
    this.status = ScanerStatus.isNoOK,
    this.errorMessage = "",
  });

  ScanerState copyWith({
    ScanerStatus? status,
    String? errorMessage,
  }) {
    return ScanerState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
