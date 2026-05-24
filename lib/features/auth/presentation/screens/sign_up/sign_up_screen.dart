import 'package:doctor_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:doctor_app/features/auth/presentation/screens/sign_up/widgets/email_and_password_and_phone.dart';
import 'package:doctor_app/features/auth/presentation/screens/sign_up/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/auth_cubit.dart';
import '../common_widgets/terms_and_condition.dart';
import '../common_widgets/welcome_message.dart';


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



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: 30,
            right: 20,
            left: 20,
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
                ),
                verticalSpace(20.0),
                CustomElevatedButton(
                  buttonName: 'Register',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().signUp(
                        SignUpParams(
                          email: emailController.text.trim(),
                          phone: phoneController.text,
                          password: passwordController.text,
                          name: nameController.text,
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
