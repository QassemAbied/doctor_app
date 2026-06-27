import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/home/data/models/doctor_model.dart';

class SupABaseDoctorDetailsService {
  final instance = Supabase.instance.client;

  Future<DoctorModel?> getDoctorById(String id) async {
    final response = await instance
        .from('doctors')
        .select('''
  *,
  specializations(
    name,
    image
  )
''')
        .eq('id', id)
        .maybeSingle();
    print('response getDoctorById $response');

    if (response == null) {
      return null;
    }

    return DoctorModel.fromJson(response);
  }

}
