import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/book_appointment/domain/entities/appointment_params.dart';

class BookAppointmentService {
  final instance = Supabase.instance.client;

  Future<void> createAppointment(AppointmentParams appointment) {
    return instance
        .from('appointments')
        .insert(appointment.toJson(),);
  }
}
