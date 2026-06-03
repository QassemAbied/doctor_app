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
