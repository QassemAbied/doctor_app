

import 'package:doctor_app/features/profile/logic/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/api_result.dart';
import '../data/repos/profile_response.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepos profileRepos;
  ProfileCubit(this.profileRepos) : super(ProfileState.initial());

  void emitProfile()async{
    if (isClosed) return;
    emit(ProfileState.loading());
    final response= await profileRepos.profile();
    if (isClosed) return;
    response.when(
        success: (profileResponse){
          emit(ProfileState.success(profileResponse));
        },
        failure: (error){
          emit(
            ProfileState.error(error: error.apiErrorModel.message ?? ''),
          );
        }
    );


  }
}
