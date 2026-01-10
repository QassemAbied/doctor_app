import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/core/theming/app_styles.dart';
import 'package:doctor_app/core/widgets/app_text_button_widget.dart';
import 'package:doctor_app/features/auth/login/Widgets/email_and_password.dart';
import 'package:doctor_app/features/auth/common_widgets/welcome_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/spacing.dart';
import 'Widgets/already_have_account.dart';
import 'Widgets/login_bloc_listener.dart';
import '../common_widgets/terms_and_condition.dart';
import 'data/models/login_request_body.dart';
import 'logic/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               WelcomeMessage(
                 welcomeText: 'welcomeText',
                 subWelcomeText: 'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
               ),
                verticalSpace(36.0),
                Column(
                  children: [
                   EmailAndPassword(),
                    verticalSpace(24.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: AppStyles.styleRegular12(
                          ColorManager.mainBlueColor,
                          context,
                        ),
                      ),
                    ),
                    verticalSpace(40.0),
                    AppTextButtonWidget(buttonName: 'Login',
                        onPressed: () {
                          if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                            context.read<LoginCubit>().emitLoginCubit( LoginRequestBody(
                              email: context.read<LoginCubit>().emailController.text,
                              password: context.read<LoginCubit>().passwordController.text,
                            ),);
                          }
                        },
                    ),
                    verticalSpace(40.0),
                    TermsAndCondition(),
                    verticalSpace(30.0),
                    AlreadyHaveAccount(),
                    LoginBlocListener(),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


