import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/extension.dart';

class UpdatePasswordBlocListener extends StatelessWidget {
  const UpdatePasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is UpdatePasswordLoading ||
          current is UpdatePasswordSuccess ||
          current is UpdatePasswordFailure,
      listener: (context, state) {
        if (state is UpdatePasswordLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is UpdatePasswordSuccess) {
          context.pop();
          context.pushNamed(Routes.loginScreen);
        }
        if (state is UpdatePasswordFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
