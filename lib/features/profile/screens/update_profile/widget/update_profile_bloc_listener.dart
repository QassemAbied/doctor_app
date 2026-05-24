import 'package:doctor_app/core/common_widgets/dialog/custom_dialog_widget.dart';
import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is UpdateUserDataLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is UpdateUserDataSuccess) {
          await context.read<AuthCubit>().getUser();
          if (!context.mounted) return;
          context.pop();

          CustomDialogWidget.showSnackBar(context, 'Success Update Profile');
        }
        if (state is UpdateUserDataFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
