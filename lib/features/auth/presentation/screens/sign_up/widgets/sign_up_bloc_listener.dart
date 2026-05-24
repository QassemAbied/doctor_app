import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../../core/utils/app_router/routes.dart';
import '../../../../../../core/utils/extension.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpFailure,
      listener: (context, state) {
        if (state is SignUpLoading) {
          CustomDialogWidget.circleDialog(context);
        }
        if (state is SignUpSuccess) {
          context.pop();
          showSuccessDialog(context);
        }
        if (state is SignUpFailure) {
          context.pop();
          CustomDialogWidget.errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Signup Successful',
            style: AppTextStyle.styleSemiBold16(ColorManager.fillGreen, context),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!',
                    style: AppTextStyle.styleMedium16(ColorManager.textSecondary, context)
                ),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
             //
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.loginScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}
