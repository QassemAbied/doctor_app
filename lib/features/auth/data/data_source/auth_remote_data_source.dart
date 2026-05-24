import 'package:doctor_app/features/auth/data/model/user_model.dart';
import 'package:doctor_app/features/auth/domain/entities/user_entity.dart';
import '../../domain/entities/sign_up_params.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> signUp(SignUpParams params);
  Future<UserEntity> signIn(SignInParams params);
  Future<void> forgotPassword(String email);
  Future<void> updatePassword(String password);
  Future<void> signOut();
  Future<UserModel> getUser();
  Future<UserModel> updateUser(UpdateUserParams updateUserParams);
}
