import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/appointment_data_time_models.dart';
import '../view/widgets/appointments_date.dart';

class AppointmentCubit extends Cubit<AppointmentData> {
  AppointmentCubit() : super(const AppointmentData());

  void selectDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  void selectTime(String time) {
    emit(state.copyWith(time: time));
  }

  void selectType(AppointmentsType type) {
    emit(state.copyWith(type: type));
  }
}
