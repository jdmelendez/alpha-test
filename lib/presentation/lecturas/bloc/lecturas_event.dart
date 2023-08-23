part of 'lecturas_bloc.dart';

abstract class LecturasEvent extends Equatable {
  const LecturasEvent();

  @override
  List<Object> get props => [];
}

class LecturasLoad extends LecturasEvent {
  const LecturasLoad();
}
