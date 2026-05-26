
import '../../../domain/entities/doctor_entity.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorSuccess extends DoctorState {
  final List<DoctorEntity> doctors;

  DoctorSuccess(this.doctors);
}

class DoctorError extends DoctorState {
  final String message;

  DoctorError(this.message);
}

