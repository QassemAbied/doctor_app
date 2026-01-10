import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/profile/data/models/update_profile_request.dart';
import 'package:doctor_app/features/profile/data/repos/update_profile_repos.dart';
import 'package:doctor_app/features/profile/logic/update_profile_state.dart';

import '../../../core/network/api_result.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepos updateProfileRepos;
  UpdateProfileCubit(this.updateProfileRepos) : super(UpdateProfileState.initial());

  void emitUpdateProfile(UpdateProfileRequest updateProfileRequest)async{
    if (isClosed) return;
    emit(UpdateProfileState.loading());
    final response= await updateProfileRepos.updateProfile(updateProfileRequest);
    if (isClosed) return;
    response.when(
        success: (data){
          emit(UpdateProfileState.success(data));
        },
        failure: (error){
          emit(
            UpdateProfileState.error(error: error.apiErrorModel.message ?? ''),
          );
        }
    );


  }
}
