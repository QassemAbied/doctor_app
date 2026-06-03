class AppointmentEntity {
  final String id;

  final String doctorId;

  final String userId;

  final String appointmentDate;

  final String appointmentTime;

  final String appointmentType;

  final String paymentMethod;

  final double price;

  final String status;

  const AppointmentEntity({
    required this.id,

    required this.doctorId,

    required this.userId,

    required this.appointmentDate,

    required this.appointmentTime,

    required this.appointmentType,

    required this.paymentMethod,

    required this.price,

    required this.status,
  });
}
