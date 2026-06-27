import '../../../../core/utils/eunm.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../home/domain/entities/doctor_entity.dart';

class AppointmentEntity {
  final String id;

  final String doctorId;

  final String userId;

  final DateTime appointmentDate;

  final String appointmentTime;

  final String appointmentType;

  final String paymentMethod;

  final double price;

  final Status status;

  final DoctorEntity doctor;

  final UserEntity? user;

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
    this.user,
  });

  bool get isCompleted => appointmentDate.isBefore(DateTime.now());

  bool get isUpcoming => appointmentDate.isAfter(DateTime.now());

  bool get isToday {
    final now = DateTime.now();

    return appointmentDate.year == now.year &&
        appointmentDate.month == now.month &&
        appointmentDate.day == now.day;
  }

  factory AppointmentEntity.fake() {
    return AppointmentEntity(
      id: '',
      doctorId: '',
      userId: '',
      appointmentDate: DateTime.now().add(const Duration(days: 1)),
      appointmentTime: '09:00 AM',
      appointmentType: 'In Person',
      paymentMethod: 'Cash',
      price: 250,
      status: Status.upcoming,
      doctor: DoctorEntity.fake(),
      user: null,
    );
  }
}
