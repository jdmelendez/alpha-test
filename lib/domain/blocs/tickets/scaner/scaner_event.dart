part of 'scaner_bloc.dart';

abstract class ScanerEvent extends Equatable {
  const ScanerEvent();

  @override
  List<Object> get props => [];
}

class ScanerRead extends ScanerEvent {
  const ScanerRead({required this.code});

  final String code;
}
