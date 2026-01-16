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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordConfirmationController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
   //emailController.dispose();
    super.dispose();
  }
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
                EmailAndPasswordAndPhone(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  nameController: nameController,
                  phoneController: phoneController,
                  passwordConfirmationController: passwordConfirmationController,
                ),
                verticalSpace(20.0),
                AppTextButtonWidget(
                  buttonName: 'Register',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<SignUpCubit>().emitSignUpCubit(
                        SignUpRequest(
                          email: emailController
                              .text,
                          phone: phoneController
                              .text,
                          password: passwordController
                              .text,
                          passwordConfirmation:passwordConfirmationController
                              .text,
                          name:nameController.text,
                          gender: 0,
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
