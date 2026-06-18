import '../../domain/entities/appointment_entity.dart';

class BookAppointmentState {}

class BookAppointmentInitial extends BookAppointmentState {}

class SelectTapBar extends BookAppointmentState {}

class SelectDay extends BookAppointmentState {}

class SelectPayment extends BookAppointmentState {}

class BookAppointmentLoading extends BookAppointmentState {}

class BookAppointmentSuccess extends BookAppointmentState {}

class BookAppointmentFailure extends BookAppointmentState {
  final String message;
  BookAppointmentFailure(this.message);
}


class AppointmentLoading extends BookAppointmentState {}

class AppointmentSuccess extends BookAppointmentState {
  final List<AppointmentEntity> appointments;
  AppointmentSuccess(this.appointments);
}

class AppointmentFailure extends BookAppointmentState {
  final String message;
 AppointmentFailure(this.message);
}



class RescheduleAppointmentLoading extends BookAppointmentState {}

class RescheduleAppointmentSuccess extends BookAppointmentState {

}

class RescheduleAppointmentFailure extends BookAppointmentState {
  final String message;
  RescheduleAppointmentFailure(this.message);
}


class StripeAppointmentLoading extends BookAppointmentState {}

class StripeAppointmentSuccess extends BookAppointmentState {

}

class StripeAppointmentFailure extends BookAppointmentState {
  final String message;
  StripeAppointmentFailure(this.message);
}
