import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../../core/utils/app_router/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is SignInLoading ||
          current is SignInSuccess ||
          current is SignInFailure,
      listener: (context, state) {
        if (state is SignInLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is SignInSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.bottonNavScreen,);
        }
        if (state is SignInFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
