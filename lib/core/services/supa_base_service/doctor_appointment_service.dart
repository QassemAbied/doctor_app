import 'package:doctor_app/features/auth/data/model/user_model.dart';
import 'package:doctor_app/features/book_appointment/data/model/appointment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/home/data/models/doctor_model.dart';
import '../../utils/eunm.dart';

class SupABaseDoctorService {
  final instance = Supabase.instance.client;

  Future<DoctorModel?> getCurrentDoctor() async {
    final userId = instance.auth.currentUser!.id;

    final response = await instance
        .from('doctors')
        .select('''
          *,
          specializations(
            name,
            image
          )
        ''')
        .eq('user_id', userId)
        .maybeSingle();

    if (response == null) {
      return null;
    }
    return DoctorModel.fromJson(response);
  }

  Future<String> getCurrentDoctorId() async {
    final userId = instance.auth.currentUser!.id;

    final doctor = await instance
        .from('doctors')
        .select('id')
        .eq('user_id', userId)
        .single();

    return doctor['id'];
  }

  Future<List<AppointmentModel>> getDoctorAppointments() async {
    final doctorId = await getCurrentDoctorId();
    final response = await instance
        .from('appointments')
        .select('''
        *,
        doctors(
          *,
          specializations(
            name,
            image
          )
        ),
        users(
          id,
          name,
          image,
          phone,
          email,
          role
        )
      ''')
        .eq('doctor_id', doctorId)
        .order('appointment_date');
    return response.map((e) => AppointmentModel.fromJson(e)).toList();
  }

  Future<List<AppointmentModel>> getTodayAppointments() async {
    final doctorId = await getCurrentDoctorId();

    final today = DateTime.now().toIso8601String().split('T').first;

    final response = await instance
        .from('appointments')
        .select('''
        *,
        doctors(
          *,
          specializations(
            name,
            image
          )
        ),
        users(
          id,
          name,
          image,
          phone,
          email,
          role
        )
      ''')
        .eq('doctor_id', doctorId)
        .gte('appointment_date', today);
    print(response);
    return response.map((e) => AppointmentModel.fromJson(e)).toList();
  }

  Future<void> updateAppointmentStatus({
    required String appointmentId,
    required Status status,
  }) async {
    await instance
        .from('appointments')
        .update({'status': status.name})
        .eq('id', appointmentId);
  }

  Future<List<UserModel>> getDoctorPatients() async {
    final doctorId = await getCurrentDoctorId();
    final response = await instance
        .from('appointments')
        .select('''
        *,
        doctors(
          *,
          specializations(
            name,
            image
          )
        ),
        users(
          id,
          name,
          image,
          phone,
          email,
          role
        )
      ''')
        .eq('doctor_id', doctorId);
    return response
        .map<UserModel>((e) => UserModel.fromJson(e['users']))
        .toList();
  }

  Future<List<AppointmentModel>> getPatientAppointments(
    String patientId,
  ) async {
    final doctorId = await getCurrentDoctorId();
    final response = await instance
        .from('appointments')
        .select('''
        *,
        doctors(
          *,
          specializations(
            name,
            image
          )
          ),
        users(
          id,
          name,
          image,
          phone,
          email,
          role
        )
      ''')
        .eq('doctor_id', doctorId)
        .eq('user_id', patientId)
        .order('appointment_date', ascending: false);
    return response.map((e) => AppointmentModel.fromJson(e)).toList();
  }

  Future getUserChatWithDoctor() async {
    final doctorId = await getCurrentDoctorId();
    final userId = instance.auth.currentUser!.id;
    return await instance
        .from('chats')
        .select()
        .eq('doctor_id', doctorId)
        .eq('user_id', userId)
        .maybeSingle();
  }
}
