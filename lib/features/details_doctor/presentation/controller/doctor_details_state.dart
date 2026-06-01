import '../../../home/domain/entities/doctor_entity.dart';

abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsSuccess extends DoctorDetailsState {
  final DoctorEntity doctor;

  DoctorDetailsSuccess(this.doctor);
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;

  DoctorDetailsError(this.message);
}
