import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/book_appointment/domain/use_case/book_appointment_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/eunm.dart';
import '../../domain/entities/appointment_params.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentUseCase _appointmentUseCase;
  BookAppointmentCubit(this._appointmentUseCase)
    : super(BookAppointmentInitial());

  PageController pageController = PageController();
  int index = 0;
  void selectTapBar(int index) {
    this.index = index;
    pageController.animateToPage(
      index,

      duration: const Duration(milliseconds: 300),

      curve: Curves.easeInOut,
    );

    emit(SelectTapBar());
  }

  int indexDays = 0;

  DateTime selectedDate = DateTime.now();

  String get titleDay => DateFormat('EEEE, dd MMM').format(selectedDate);

  void selectDay(int index, DateTime title) {
    indexDays = index;
    selectedDate = title;
    emit(SelectDay());
  }

  int indexTime = 0;
  String timeAppointments = '08:00 AM';
  void selectTime(int time, String times) {
    indexTime = time;
    timeAppointments = times;
    emit(SelectDay());
  }

  AppointmentsType selectedType = AppointmentsType.inPerson;
  void selectType(AppointmentsType selected) {
    selectedType = selected;
    emit(SelectDay());
  }

  CardType cardType = CardType.credit;
  void selectPayment(CardType selected) {
    cardType = selected;
    emit(SelectPayment());
  }

  Future<void> bookAppointment(AppointmentParams params) async {
    emit(BookAppointmentLoading());

    final response = await _appointmentUseCase(params);
    response.fold(

          (failure) {

        print(
          failure.message,
        );

        emit(
          BookAppointmentFailure(
            failure.message,
          ),
        );
      },

          (success) {

        print(
          'success',
        );

        emit(
          BookAppointmentSuccess(),
        );
      },
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();

    return super.close();
  }
}
