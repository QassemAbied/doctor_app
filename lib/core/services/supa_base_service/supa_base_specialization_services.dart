import 'package:doctor_app/features/home/data/models/specialization_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/home/data/models/doctor_model.dart';

class SupABaseSpecializationServices {
  final instance = Supabase.instance.client;

  Future<List<SpecializationModel>> getSpecialization() async {
    final response = await instance.from('specializations').select();
    print('response SpecializationModel $response');
    return response
        .map<SpecializationModel>((e) => SpecializationModel.fromJson(e))
        .toList();
  }

  Future<List<DoctorModel>> getDoctors() async {
    final response = await instance.from('doctors').select('''
  *,
  specializations(
    name,
    image
  )
''');
    print('response getDoctors $response');
    return response.map<DoctorModel>((e) => DoctorModel.fromJson(e)).toList();
  }
}
