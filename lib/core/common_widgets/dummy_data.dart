import '../../features/home/domain/entities/doctor_entity.dart';
import '../../features/home/domain/entities/specialization_entity.dart';

class DummyData {

  static List<SpecializationEntity>
  fakeSpecializations = List.generate(

    6,

        (index) =>
        SpecializationEntity.fake(),
  );

  static List<DoctorEntity>
  fakeDoctors = List.generate(
    6,

        (index) => DoctorEntity.fake(),
  );

}