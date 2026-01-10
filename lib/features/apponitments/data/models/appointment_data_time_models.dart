import '../../view/widgets/appointments_date.dart';

class AppointmentData {
  final DateTime? date;
  final String? time;
  final AppointmentsType? type;

  const AppointmentData({
    this.date,
    this.time,
    this.type,
  });

  AppointmentData copyWith({
    DateTime? date,
    String? time,
    AppointmentsType? type,
  }) {
    return AppointmentData(
      date: date ?? this.date,
      time: time ?? this.time,
      type: type ?? this.type,
    );
  }
}
