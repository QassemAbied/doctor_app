import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/auth/data/model/user_model.dart';
import '../../../features/auth/domain/entities/sign_up_params.dart';

class SupAbaseAuthService {
  final instance = Supabase.instance.client;

  Future<AuthResponse> signUp(SignUpParams params) async {
    return await instance.auth.signUp(
      email: params.email.trim(),
      password: params.password.trim(),
    );
  }

  Future<AuthResponse> signIn(SignInParams params) async {
    return await instance.auth.signInWithPassword(
      email: params.email.trim(),
      password: params.password.trim(),
    );
  }

  Future<void> createUser(SignUpParams params, String userId) async {
    return await instance.from('users').insert({
      'id': userId,
      'name': params.name,
      'email': params.email,
      'phone': params.phone,
      'image': params.image,
    });
  }

  Future<void> forgotPassword(String email) async {
    await instance.auth.resetPasswordForEmail(
      email.trim(),
      redirectTo: 'doctorapp://reset-password',
    );
  }

  Future<void> updatePassword(String password) async {
    await instance.auth.updateUser(UserAttributes(password: password.trim()));
  }

  Future<void> signOut() async {
    await instance.auth.signOut();
  }

  Future<UserModel> getUser() async {
    final user = instance.auth.currentUser;
    if (user == null) {
      throw Exception('User is null');
    }
    final response = await instance
        .from('users')
        .select()
        .eq('id', user.id)
        .single();
    return UserModel.fromJson(response);
  }

  Future<UserModel> updateUser(UpdateUserParams updateUserParams) async {
    final user = instance.auth.currentUser;

    if (user == null) {
      throw Exception('User is null');
    }

    final response = await instance
        .from('users')
        .update({
          'name': updateUserParams.name,

          'email': updateUserParams.email,

          'phone': updateUserParams.phone,

          'image': updateUserParams.image,
        })
        .eq('id', user.id)
        .select()
        .single();

    return UserModel.fromJson(response);
  }
}
