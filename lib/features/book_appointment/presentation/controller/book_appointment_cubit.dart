import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/book_appointment/domain/entities/appointment_entity.dart';
import 'package:doctor_app/features/book_appointment/domain/use_case/book_appointment_usecase.dart';
import 'package:doctor_app/features/book_appointment/domain/use_case/reschedule_appointment_uescase.dart';
import 'package:doctor_app/features/book_appointment/domain/use_case/my_appointment_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/eunm.dart';
import '../../domain/entities/appointment_params.dart';
import '../../domain/use_case/cancel_appointment_usecase.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final BookAppointmentUseCase _appointmentUseCase;
  final MyAppointmentUseCase _myAppointmentUseCase;
  final RescheduleAppointmentUesCase _rescheduleAppointmentUesCase;
  final CancelAppointmentUseCase _cancelAppointmentUseCase;

  BookAppointmentCubit(
    this._appointmentUseCase,
    this._myAppointmentUseCase,
    this._rescheduleAppointmentUesCase,
    this._cancelAppointmentUseCase,
  ) : super(BookAppointmentInitial());

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
  List<DateTime> showDate() {
    final now = DateTime.now();
    return List.generate(30, (i) => now.add(Duration(days: i)));
  }

  DateTime selectedDate = DateTime.now();

  String get titleDay => DateFormat('EEEE, dd MMM').format(selectedDate);

  void selectDay(int index, DateTime date) {
    indexDays = index;

    selectedDate = date;

    emit(SelectDay());
  }

  int indexTime = 0;

  String selectedTime = '08:00 AM';

  final List<String> timeList = [
    '08:00 AM',

    '08:30 AM',

    '09:00 AM',

    '09:30 AM',

    '10:00 AM',

    '11:00 AM',
  ];

  void selectTime(int index, String time) {
    indexTime = index;

    selectedTime = time;

    emit(SelectDay());
  }

  AppointmentsType selectedType = AppointmentsType.inPerson;

  void selectType(AppointmentsType type) {
    selectedType = type;

    emit(SelectDay());
  }

  void setInitialData({
    required String time,

    required String type,

    required String date,
  }) {
    selectedTime = time;

    final foundTimeIndex = timeList.indexOf(time);

    if (foundTimeIndex != -1) {
      indexTime = foundTimeIndex;
    }

    selectedDate = DateTime.parse(date);

    final dates = showDate();

    final foundDayIndex = dates.indexWhere(
      (e) =>
          e.day == selectedDate.day &&
          e.month == selectedDate.month &&
          e.year == selectedDate.year,
    );

    if (foundDayIndex != -1) {
      indexDays = foundDayIndex;
    }

    selectedType = AppointmentsType.values.firstWhere(
      (e) => e.name == type,

      orElse: () => AppointmentsType.inPerson,
    );

    emit(SelectDay());
  }

  CardType cardType = CardType.credit;
  void selectPayment(CardType selected) {
    cardType = selected;
    emit(SelectPayment());
  }

  Future<void> bookAppointment(AppointmentParams params) async {
    if (!isClosed) {
      emit(BookAppointmentLoading());
    }

    final response = await _appointmentUseCase(params);

    response.fold(
      (failure) {
        if (!isClosed) {
          emit(BookAppointmentFailure(failure.message));
        }
      },

      (success) {
        if (!isClosed) {
          emit(BookAppointmentSuccess());
        }
      },
    );
  }

  List<AppointmentEntity> appointmentEntity = [];
  Future<void> getAppointment() async {
    emit(AppointmentLoading());
    final response = await _myAppointmentUseCase();
    response.fold(
      (failure) {
        emit(AppointmentFailure(failure.message));
      },
      (data) {
        appointmentEntity = data;
        emit(AppointmentSuccess(appointmentEntity));
      },
    );
  }

  Future<void> cancelAppointment(String id) async {
    await _cancelAppointmentUseCase(id);
    getAppointment();
  }

  Future<void> rescheduleAppointment(RescheduleAppointmentParams params) async {
    emit(RescheduleAppointmentLoading());

    final response = await _rescheduleAppointmentUesCase(params);

    response.fold(
      (failure) {
        emit(RescheduleAppointmentFailure(failure.message));
      },
      (success) {
        emit(RescheduleAppointmentSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();

    return super.close();
  }
}
