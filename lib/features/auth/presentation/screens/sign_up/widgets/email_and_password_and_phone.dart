import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../../../core/helpers/app_regex.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../common_widgets/password_vailadet.dart';

class EmailAndPasswordAndPhone extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  const EmailAndPasswordAndPhone({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
  });

  @override
  State<EmailAndPasswordAndPhone> createState() =>
      _EmailAndPasswordAndPhoneState();
}

class _EmailAndPasswordAndPhoneState extends State<EmailAndPasswordAndPhone> {
  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    widget.passwordController!.addListener(() {
      context.read<AuthCubit>().changePasswordCondition(
        widget.passwordController!,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextField(
            textInputType: TextInputType.name,
            controller: widget.nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Name';
              }
            },
          ),
          verticalSpace(15.0),
          AppTextField(
            textInputType: TextInputType.emailAddress,
            controller: widget.emailController,
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
          AppTextField(
            textInputType: TextInputType.phone,
            controller: widget.phoneController,
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return Column(
                children: [
                  AppTextField(
                    textInputType: TextInputType.visiblePassword,
                    controller: widget.passwordController,
                    hintText: 'Password',
                    isPassword: cubit.passwordSigUp,
                    suffix: GestureDetector(
                      onTap: () {
                        cubit.changePasswordSignUp(cubit.passwordSigUp);
                      },
                      child: Icon(
                        cubit.passwordSigUp
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return 'Please Enter Your Password';
                      }
                    },
                  ),
                  verticalSpace(14.0),

                  widget.passwordController!.text.isEmpty
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
}
