import 'package:doctor_app/core/services/supa_base_service/supa_base_doctor_details_service.dart';
import 'package:doctor_app/features/details_doctor/data/data_source/remote_data_source/details_remote_data_source.dart';
import 'package:doctor_app/features/home/data/models/doctor_model.dart';

class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource{
  final SupABaseDoctorDetailsService _aBaseDoctorDetailsService;

  DetailsRemoteDataSourceImpl(this._aBaseDoctorDetailsService);

  @override
  Future<DoctorModel?> getDoctorById(String id) async{
    return await _aBaseDoctorDetailsService.getDoctorById(id);
  }
  }
