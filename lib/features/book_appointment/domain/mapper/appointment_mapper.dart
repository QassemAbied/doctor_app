import '../../../auth/domain/mapper/user_mapper.dart';
import '../../../home/domain/mapper/doctor_mapper.dart';
import '../../data/model/appointment_model.dart';
import '../entities/appointment_entity.dart';

class AppointmentMapper {
  static AppointmentEntity toEntity(
      AppointmentModel model,
      ) {
    return AppointmentEntity(
      id: model.id,
      doctorId: model.doctorId,
      userId: model.userId,
      appointmentDate: DateTime.parse(
        model.appointmentDate,
      ),
      appointmentTime: model.appointmentTime,
      appointmentType: model.appointmentType,
      paymentMethod: model.paymentMethod,
      price: model.price,
      status: model.status,
      doctor: DoctorMapper.toEntity(
        model.doctor,
      ),
      user: model.user == null
          ? null
          : UserMapper.toEntity(model.user!),
    );
  }

  static List<AppointmentEntity> toEntityList(
      List<AppointmentModel> models,
      ) {
    return models
        .map(toEntity)
        .toList();
  }
}