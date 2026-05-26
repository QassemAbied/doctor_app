import 'package:doctor_app/features/home/data/models/specialization_model.dart';

import '../../models/doctor_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<SpecializationModel>> getSpecialization();
  Future<List<DoctorModel>> getDoctors();
}
