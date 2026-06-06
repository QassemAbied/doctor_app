import 'package:doctor_app/features/book_appointment/data/model/appointment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/book_appointment/domain/entities/appointment_params.dart';
import '../../utils/eunm.dart';

class BookAppointmentService {
  final instance = Supabase.instance.client;

  Future<void> createAppointment(AppointmentParams appointment) {
    return instance.from('appointments').insert(appointment.toJson());
  }

  Future<List<AppointmentModel>> getAppointment() async {
    final user = instance.auth.currentUser;
    if (user == null) {
      throw Exception('User is null');
    }
    final response = await instance
        .from('appointments')
        .select('''
      *,
      doctors(
        *,
        specializations(*)
      )
    ''')
        .eq('user_id', user.id);
    print('response getAppointment $response');
    return response
        .map<AppointmentModel>((e) => AppointmentModel.fromJson(e))
        .toList();
  }

  Future<void> rescheduleAppointment(RescheduleAppointmentParams params) async {
    await instance
        .from('appointments')
        .update(params.toJson())
        .eq('id', params.id);
  }

  Future<void> cancelAppointment(String id) async {
    final response = await instance
        .from('appointments')
        .update({'status': Status.cancelled.name})
        .eq('id', id)
        .select();

    print(response);
    print('cancelAppointment');
  }
}
