import 'package:doctor_app/core/di/dependey.dart';
import 'package:doctor_app/features/auth/common_widgets/password_vailadet.dart';
import 'package:doctor_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:doctor_app/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_text_filed.dart';

class EmailAndPasswordAndPhone extends StatefulWidget {
  const EmailAndPasswordAndPhone({super.key});

  @override
  State<EmailAndPasswordAndPhone> createState() =>
      _EmailAndPasswordAndPhoneState();
}

class _EmailAndPasswordAndPhoneState extends State<EmailAndPasswordAndPhone> {
  bool hasLowerCase = true;
  bool hasUpperCase = true;
  bool hasSpecialCharacters = true;
  bool hasNumber = true;
  bool hasMinLength = true;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
  @override
  void dispose() {
    context.read<SignUpCubit>().emailController.dispose();
    context.read<SignUpCubit>().nameController.dispose();
    context.read<SignUpCubit>().phoneController.dispose();
    context.read<SignUpCubit>().passwordController.dispose();
    context.read<SignUpCubit>().passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFiled(
            textInputType: TextInputType.name,
            controller: context.read<SignUpCubit>().nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Name';
              }
            },
          ),
          verticalSpace(15.0),
          AppTextFiled(
            textInputType: TextInputType.emailAddress,
            controller: context.read<SignUpCubit>().emailController,
            helperText: r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter Your Email';
              }
            },
          ),
          verticalSpace(15.0),
          AppTextFiled(
            textInputType: TextInputType.phone,
            controller: context.read<SignUpCubit>().phoneController,
            hintText: 'Phone',
            helperText: r'^(010|011|012|015)[0-9]{8}$',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please Enter Your PhoneNumber';
              }
            },
          ),
          verticalSpace(15.0),
          BlocProvider(
            create: (context) => getIt<ToggleSignUpCubit>(),
            child: BlocBuilder<ToggleSignUpCubit, ToggleSignUpState>(
              builder: (context, state) {
                //final cubit = context.read<SignUpCubit>();
                return Column(
                  children: [
                    AppTextFiled(
                      textInputType: TextInputType.visiblePassword,
                      controller: context
                          .read<SignUpCubit>()
                          .passwordController,
                      hintText: 'Password',
                      isPassword: state.obscure1,
                      suffix: GestureDetector(
                        onTap: () {
                          context.read<ToggleSignUpCubit>().toggleObscure1();
                        },
                        child: Icon(
                          state.obscure1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty||
                            !AppRegex.isPasswordValid(value)) {
                          return 'Please Enter Your Password';
                        }
                      },
                    ),
                    verticalSpace(14.0),
                    AppTextFiled(
                      textInputType: TextInputType.visiblePassword,
                      controller: context
                          .read<SignUpCubit>()
                          .passwordConfirmationController,
                      hintText: 'passwordConfirmation',
                      isPassword: state.obscure2,
                      suffix: GestureDetector(
                        onTap: () {
                          context.read<ToggleSignUpCubit>().toggleObscure2();
                        },
                        child: Icon(
                          state.obscure2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty||
                            !AppRegex.isPasswordValid(value)) {
                          return 'Please Enter Your Password';
                        }
                      },
                    ),
                    verticalSpace(14.0),
                    //  context.read<LoginCubit>().passwordController.text.isEmpty? SizedBox.shrink():
                    context.read<SignUpCubit>().passwordController.text.isEmpty
                        ? SizedBox.shrink()
                        : PasswordValidations(
                            hasLowerCase: hasLowerCase,
                            hasUpperCase: hasUpperCase,
                            hasSpecialCharacters: hasSpecialCharacters,
                            hasNumber: hasNumber,
                            hasMinLength: hasMinLength,
                          ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
