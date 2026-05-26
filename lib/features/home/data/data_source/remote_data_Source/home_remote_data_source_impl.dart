import 'package:doctor_app/core/services/supa_base_service/supa_base_specialization_services.dart';
import 'package:doctor_app/features/home/data/data_source/remote_data_Source/home_remote_data_source.dart';
import 'package:doctor_app/features/home/data/models/doctor_model.dart';
import 'package:doctor_app/features/home/data/models/specialization_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupABaseSpecializationServices _supABaseSpecializationServices;

  HomeRemoteDataSourceImpl(this._supABaseSpecializationServices);
  @override
  Future<List<SpecializationModel>> getSpecialization() async {
    return await _supABaseSpecializationServices.getSpecialization();
  }

  @override
  Future<List<DoctorModel>> getDoctors() async{
    return await _supABaseSpecializationServices.getDoctors();
  }
}
