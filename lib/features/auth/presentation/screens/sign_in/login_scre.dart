import 'package:doctor_app/core/utils/extension.dart';
import 'package:doctor_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/utils/app_router/routes.dart';
import '../common_widgets/terms_and_condition.dart';
import '../common_widgets/welcome_message.dart';
import 'Widgets/already_have_account.dart';
import 'Widgets/email_and_password.dart';
import 'Widgets/login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                   EmailAndPassword(
                     formKey: formKey,
                     emailController: emailController,
                     passwordController: passwordController,),
                    verticalSpace(24.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){
                        context.pushNamed(Routes.forgetScreen);
                      },
                          child: Text(
                            'Forgot Password?',

                          ),),
                    ),
                    verticalSpace(40.0),
                    CustomElevatedButton(
                      buttonName: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().signIn( SignInParams(
                              email: emailController.text,
                              password: passwordController.text,
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


