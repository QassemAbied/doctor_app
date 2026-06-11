import '../../features/book_appointment/domain/entities/appointment_entity.dart';
import '../../features/home/domain/entities/doctor_entity.dart';
import '../../features/home/domain/entities/specialization_entity.dart';
import '../../features/notification/domain/entity/local_notification_entities.dart';

class DummyData {
  static List<SpecializationEntity> fakeSpecializations = List.generate(
    6,

    (index) => SpecializationEntity.fake(),
  );

  static List<DoctorEntity> fakeDoctors = List.generate(
    6,

    (index) => DoctorEntity.fake(),
  );

  static DoctorEntity fakeDetailsDoctor = DoctorEntity.fake();
  static List<AppointmentEntity> fakeAppointments = List.generate(
    6,
    (index) => AppointmentEntity.fake(),
  );
  static List<NotificationEntity> fakeNotifications = List.generate(
    6,

    (index) => NotificationEntity.fake(),
  );
}
