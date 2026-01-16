import 'package:doctor_app/core/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            return showDialog(
              context: context,
              builder: (context) {
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          success: (value) {
            context.navigatorPop();
            return context.pushNamedAndRemoveUntil(
              Routes.bottonNavScreen,
              (_) => false,
            );
          },
          error: (value) {
            context.navigatorPop();
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(value));
              },
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
