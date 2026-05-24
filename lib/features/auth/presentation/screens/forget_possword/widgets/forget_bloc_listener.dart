import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is ForgotPasswordLoading ||
          current is ForgotPasswordSuccess ||
          current is ForgotPasswordFailure,
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is ForgotPasswordSuccess) {
          context.pop();
          CustomDialogWidget.showSnackBar(
            context,
            'Password reset email sent successfully! Please check your inbox.',
          );
        }
        if (state is ForgotPasswordFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
