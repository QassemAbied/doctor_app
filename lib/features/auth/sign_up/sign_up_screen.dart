import 'package:doctor_app/features/auth/sign_up/data/models/sign_up_request.dart';
import 'package:doctor_app/features/auth/sign_up/widgets/email_and_password_and_phone.dart';
import 'package:doctor_app/features/auth/sign_up/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/app_text_button_widget.dart';
import '../common_widgets/terms_and_condition.dart';
import '../common_widgets/welcome_message.dart';
import 'logic/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: 30,
            right: 30,
            left: 30,
            bottom: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeMessage(
                  welcomeText: 'Create Account',
                  subWelcomeText:
                      'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                ),
                verticalSpace(26.0),
                EmailAndPasswordAndPhone(),
                verticalSpace(20.0),
                AppTextButtonWidget(
                  buttonName: 'Register',
                  onPressed: () {
                    if (context
                        .read<SignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<SignUpCubit>().emitSignUpCubit(
                        SignUpRequest(
                          email: context.read<SignUpCubit>().emailController.text,
                          phone: context.read<SignUpCubit>().phoneController.text,
                          password: context.read<SignUpCubit>().passwordController.text,
                          passwordConfirmation: context.read<SignUpCubit>().passwordConfirmationController.text,
                          name: context.read<SignUpCubit>().nameController.text, gender: 0,
                        ),
                      );
                    }
                  },
                ),
                verticalSpace(20.0),
                TermsAndCondition(),
               SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
