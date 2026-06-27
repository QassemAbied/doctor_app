import '../../../auth/domain/entities/user_entity.dart';
import '../../../book_appointment/domain/entities/appointment_entity.dart';
import '../../../home/domain/entities/doctor_entity.dart';

abstract class CurrentDoctorState {}

class DoctorInitial extends CurrentDoctorState {}

class CurrentDoctorLoading extends CurrentDoctorState {}

class CurrentDoctorSuccess extends CurrentDoctorState {
  final DoctorEntity doctor;
  final List<dynamic> appointments;
  final List<AppointmentEntity> todayAppointments;

  CurrentDoctorSuccess({
    required this.doctor,
    required this.appointments,
    required this.todayAppointments,
  });
}

class CurrentDoctorFailure extends CurrentDoctorState {
  final String message;

  CurrentDoctorFailure(this.message);
}

class DoctorAppointmentsLoading extends CurrentDoctorState {}

class DoctorAppointmentsSuccess extends CurrentDoctorState {
  final List<AppointmentEntity> appointments;
  DoctorAppointmentsSuccess(this.appointments);
}

class DoctorAppointmentsFailure extends CurrentDoctorState {
  final String message;
  DoctorAppointmentsFailure(this.message);
}

class DoctorPatientsLoading extends CurrentDoctorState {}

class DoctorPatientsSuccess extends CurrentDoctorState {
  final List<UserEntity> patients;

  DoctorPatientsSuccess(this.patients);
}

class DoctorPatientsFailure extends CurrentDoctorState {
  final String message;

  DoctorPatientsFailure(this.message);
}

class PatientDetailsLoading extends CurrentDoctorState {}

class PatientDetailsSuccess extends CurrentDoctorState {
  final List<AppointmentEntity> appointments;

  PatientDetailsSuccess(this.appointments);
}

class PatientDetailsFailure extends CurrentDoctorState {
  final String message;

  PatientDetailsFailure(this.message);
}
