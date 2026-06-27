import 'package:bloc/bloc.dart';

import '../../../../core/services/supa_base_service/doctor_appointment_service.dart';
import '../../../../core/utils/eunm.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/domain/mapper/user_mapper.dart';
import '../../../book_appointment/domain/mapper/appointment_mapper.dart';
import '../../../home/domain/mapper/doctor_mapper.dart';
import 'doctor_state.dart';

class CurrentDoctorCubit extends Cubit<CurrentDoctorState> {
  CurrentDoctorCubit() : super(DoctorInitial());

  final _doctorService = SupABaseDoctorService();

  Future<void> getDoctorData() async {
    emit(CurrentDoctorLoading());

    try {
      final doctorResponse = await _doctorService.getCurrentDoctor();

      if (doctorResponse == null) {
        emit(CurrentDoctorFailure('Doctor not found'));
        return;
      }

      final appointments = await _doctorService.getDoctorAppointments();

      final todayAppointments = await _doctorService.getTodayAppointments();
      emit(
        CurrentDoctorSuccess(
          doctor: DoctorMapper.toEntity(doctorResponse),
          appointments: appointments,
          todayAppointments: AppointmentMapper.toEntityList(todayAppointments),
        ),
      );
    } catch (e) {
      print(e);
      print(e.toString());
      emit(CurrentDoctorFailure(e.toString()));
    }
  }

  Future<void> getAppointments() async {
    emit(DoctorAppointmentsLoading());

    try {
      final appointments = await SupABaseDoctorService()
          .getDoctorAppointments();

      emit(DoctorAppointmentsSuccess(AppointmentMapper.toEntityList(appointments),));
    } catch (e) {
      emit(DoctorAppointmentsFailure(e.toString()));
    }
  }

  Future<void> completeAppointment(String appointmentId) async {
    await SupABaseDoctorService().updateAppointmentStatus(
      appointmentId: appointmentId,
      status: Status.completed,
    );

    await getAppointments();
  }

  Future<void> cancelAppointment(String appointmentId) async {
    await SupABaseDoctorService().updateAppointmentStatus(
      appointmentId: appointmentId,
      status: Status.cancelled,
    );

    await getAppointments();
  }

  Future<void> getPatients() async {
    emit(DoctorPatientsLoading());

    try {
      final response = await SupABaseDoctorService().getDoctorPatients();

      final uniquePatients = <String, UserEntity>{};

      for (final patient in response) {
        final entity = UserMapper.toEntity(patient);
        uniquePatients[entity.id] = entity;
      }

      emit(
        DoctorPatientsSuccess(
          uniquePatients.values.toList(),
        ),
      );
    } catch (e) {
      emit(DoctorPatientsFailure(e.toString()));
    }
  }
  Future<void> getPatientDetails(String patientId) async {
    emit(PatientDetailsLoading());

    try {
      final response = await SupABaseDoctorService().getPatientAppointments(
        patientId,
      );

      emit(PatientDetailsSuccess(AppointmentMapper.toEntityList(response)));
    } catch (e) {
      emit(PatientDetailsFailure(e.toString()));
    }
  }
}
