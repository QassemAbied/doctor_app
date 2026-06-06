import '../../../../core/utils/eunm.dart';
import '../../../home/domain/entities/doctor_entity.dart';

class AppointmentEntity {
  final String id;

  final String doctorId;

  final String userId;

  final String appointmentDate;

  final String appointmentTime;

  final String appointmentType;

  final String paymentMethod;

  final double price;

  final Status status;
  final DoctorEntity doctor;
  bool get isCompleted {
    return DateTime.parse(appointmentDate).isBefore(DateTime.now());
  }

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
    required this.doctor,
  });
  factory AppointmentEntity.fake() {
    return AppointmentEntity(
      id: '',
      price: 250,

      doctorId: '',
      userId: '',
      appointmentDate: DateTime.now().add(Duration(days: 1)).toString(),
      appointmentTime: '09:00 AM',
      appointmentType: 'vyuhijohiguiyf',
      paymentMethod: '',
      status: Status.upcoming,
      doctor: DoctorEntity.fake(),
    );
  }
}
