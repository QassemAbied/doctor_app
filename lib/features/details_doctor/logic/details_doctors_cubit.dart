



import 'package:doctor_app/core/network/api_result.dart';
import 'package:doctor_app/features/details_doctor/data/models/details_doctors_models.dart';
import 'package:doctor_app/features/details_doctor/data/repos/repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_doctors_state.dart';

class DetailsDoctorsCubit extends Cubit<DetailsDoctorsState> {
  final DetailsDoctorsRepos detailsDoctorsRepos;
  DetailsDoctorsCubit(this.detailsDoctorsRepos) : super(const DetailsDoctorsState.initials());


  void emitDetailsDoctors(int id)async{
    emit(DetailsDoctorsState.loading());
    final response = await detailsDoctorsRepos.detailsDoctors(id);
    response.when(
        success: (detailsDoctorsModels){
        final  dataDoctors= detailsDoctorsModels.dataForDoctors;
          emit(DetailsDoctorsState.success(dataDoctors ));
        },
        failure:(error) {
          emit(DetailsDoctorsState.error( messages: error.apiErrorModel.message ?? 'Error', ));
        },
    );
  }
}
