import 'package:doctor_app/core/helpers/app_regex.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../common_widgets/password_vailadet.dart';

class EmailAndPassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  const EmailAndPassword({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController passwordController;
  @override
  void initState() {
    passwordController = widget.passwordController!;
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      context.read<AuthCubit>().changePasswordCondition(passwordController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextField(
            textInputType: TextInputType.emailAddress,
            controller: widget.emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter Your Email';
              }
            },
          ),
          verticalSpace(25.0),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return Column(
                children: [
                  AppTextField(
                    textInputType: TextInputType.visiblePassword,
                    controller: widget.passwordController,
                    hintText: 'Password',
                    isPassword: cubit.passwordSignIn,
                    suffix: GestureDetector(
                      onTap: () {
                        cubit.changePasswordSignIn(cubit.passwordSignIn);
                      },
                      child: Icon(
                        cubit.passwordSignIn
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                  ),
                  verticalSpace(24.0),
                  passwordController.text.isEmpty
                      ? SizedBox.shrink()
                      : PasswordValidations(
                          hasLowerCase: cubit.hasLowerCase,
                          hasUpperCase: cubit.hasUpperCase,
                          hasSpecialCharacters: cubit.hasSpecialCharacters,
                          hasNumber: cubit.hasNumber,
                          hasMinLength: cubit.hasMinLength,
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.emailController!.dispose();
    widget.passwordController!.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
