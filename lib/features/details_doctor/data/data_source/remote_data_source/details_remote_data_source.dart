import '../../../../home/data/models/doctor_model.dart';

abstract class DetailsRemoteDataSource {
  Future<DoctorModel?> getDoctorById(String id);
}
