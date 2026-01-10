

import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/features/my_appointment/data/repos/my_appointment_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_appointment_state.dart';

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  final MyAppointmentRepos myAppointmentRepos;
  MyAppointmentCubit(this.myAppointmentRepos) : super(MyAppointmentState.initial());

  void emitMyAppointment()async{
    if (isClosed) return;
    emit(MyAppointmentState.loading());
    final response= await myAppointmentRepos.myAppointment();
    if (isClosed) return;
    response.when(
        success: (myAppointmentResponse){
          emit(MyAppointmentState.success(myAppointmentResponse));
        },
        failure: (error){
          emit(
            MyAppointmentState.error(error: error.apiErrorModel.message ?? ''),
          );
        }
    );


  }
}
