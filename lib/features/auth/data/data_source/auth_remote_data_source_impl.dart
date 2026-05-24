import 'package:doctor_app/core/services/shared_pref/shared_pref_helpers.dart';
import 'package:doctor_app/core/services/supa_base_service/supa_base_auth_service.dart';
import 'package:doctor_app/features/auth/data/model/user_model.dart';

import '../../../../core/services/shared_pref/shared_pref_keys.dart';
import '../../domain/entities/sign_up_params.dart';
import '../../domain/entities/user_entity.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupAbaseAuthService _supAbaseAuthService;

  AuthRemoteDataSourceImpl(this._supAbaseAuthService);

  @override
  Future<UserEntity> signUp(SignUpParams params) async {
    final response = await _supAbaseAuthService.signUp(params);

    final user = response.user;

    if (user == null) {
      throw Exception('User is null');
    }

    await _supAbaseAuthService.createUser(params, user.id);

    return UserEntity(
      id: user.id,
      name: params.name,
      email: params.email,
      phone: params.phone,
      image: params.image,
    );
  }

  @override
  Future<UserEntity> signIn(SignInParams params) async {
    final response = await _supAbaseAuthService.signIn(params);

    final user = response.user;
    //final session = response.session;
    if (user == null) {
      throw Exception('User is null');
    }

    await SharedPrefHelper.setData(SharedPrefKeys.userId, user.id);
    return UserEntity(
      id: user.id,
      name: '',
      email: user.email ?? '',
      phone: '',
      image: '',
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await _supAbaseAuthService.forgotPassword(email);
  }

  @override
  Future<void> updatePassword(String password) async {
    return await _supAbaseAuthService.updatePassword(password);
  }

  @override
  Future<void> signOut() async {
    return await _supAbaseAuthService.signOut();
  }

  @override
  Future<UserModel> getUser()async {
    return await _supAbaseAuthService.getUser();
  }

  @override
  Future<UserModel> updateUser(UpdateUserParams updateUserParams)async {
    return await _supAbaseAuthService.updateUser(updateUserParams);
  }
}
