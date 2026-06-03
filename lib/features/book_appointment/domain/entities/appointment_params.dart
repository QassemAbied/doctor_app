import '../../../home/domain/entities/doctor_entity.dart';

class AppointmentParams {
  final DoctorEntity doctor;

  final String doctorId;

  final String userId;

  final String appointmentDate;

  final String appointmentTime;

  final String appointmentType;

  final String paymentMethod;

  final double price;

  const AppointmentParams({
    required this.doctor,

    required this.doctorId,

    required this.userId,

    required this.appointmentDate,

    required this.appointmentTime,

    required this.appointmentType,

    required this.paymentMethod,

    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,

      'user_id': userId,

      'appointment_date': appointmentDate,

      'appointment_time': appointmentTime,

      'appointment_type': appointmentType,

      'payment_method': paymentMethod,

      'price': price,
    };
  }
}
