import 'package:doctor_app/core/helpers/app_regex.dart';
import 'package:doctor_app/features/auth/common_widgets/password_vailadet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_text_filed.dart';
import '../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {

  bool obscure = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFiled(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null|| value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please Enter Your Email';
              }
            },
      ),
          verticalSpace(25.0),
          AppTextFiled(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isPassword: obscure,
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  obscure = !obscure;
                });
              },
              child: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null|| value.isEmpty ) {
                return 'Please Enter Your Password';
              }
            },
          ),
          verticalSpace(24.0),
        //  context.read<LoginCubit>().passwordController.text.isEmpty? SizedBox.shrink():
          PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
