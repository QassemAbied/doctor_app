import '../../data/model/appointment_model.dart';
import '../../domain/entities/appointment_entity.dart';

extension AppointmentMapper on AppointmentModel {
  AppointmentEntity toEntity() {
    return AppointmentEntity(
      id: id,

      doctorId: doctorId,

      userId: userId,

      appointmentDate: appointmentDate,

      appointmentTime: appointmentTime,

      appointmentType: appointmentType,

      paymentMethod: paymentMethod,

      price: price,

      status: status,
    );
  }
}
