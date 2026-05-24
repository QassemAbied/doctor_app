import 'package:doctor_app/features/auth/presentation/screens/update_password/widget/update_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/auth_state.dart';
import '../common_widgets/password_vailadet.dart';
import '../common_widgets/welcome_message.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      context.read<AuthCubit>().changePasswordCondition(
      passwordController,
      );
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Scaffold(
          appBar: AppBar(),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  WelcomeMessage(
                    welcomeText: 'Update Password',
                    subWelcomeText:
                    'At our app, we take the security of your information seriously.',
                  ),
                  verticalSpace(20),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final cubit = context.read<AuthCubit>();
                      return Column(
                        children: [
                          AppTextField(
                            textInputType: TextInputType.visiblePassword,
                            controller: passwordController,
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
                          AppTextField(
                            textInputType: TextInputType.visiblePassword,
                            controller: confirmPasswordController,
                            hintText: 'Confirm Password',
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
                              if (value == null ||
                                  value.isEmpty ||
                                  !AppRegex.isPasswordValid(value)) {
                                return 'Please Enter Your Confirm Password';
                              }
                            },
                          ),
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
                  Spacer(),
                  CustomElevatedButton(
                    buttonName: 'Confirm Password',
                    onPressed: () {
                      if(passwordController.text != confirmPasswordController.text){
                        CustomDialogWidget.errorDialog(context, 'Passwords do not match',);
                        return;
                      }

                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<AuthCubit>().updatePassword(passwordController.text);
                      }
                    },
                  ),
                  UpdatePasswordBlocListener()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
