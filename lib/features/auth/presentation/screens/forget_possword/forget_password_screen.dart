import 'package:doctor_app/core/utils/spacing.dart';
import 'package:doctor_app/features/auth/presentation/screens/forget_possword/widgets/forget_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/custom_elevated_botton.dart';
import '../../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../controller/auth_cubit.dart';
import '../common_widgets/welcome_message.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    welcomeText: 'Forgot Password',
                    subWelcomeText:
                        'At our app, we take the security of your information seriously.',
                  ),
                  verticalSpace(20),
                  AppTextField(
                    textInputType: TextInputType.emailAddress,
                    controller: controller,
                    hintText: 'Email',
                    helperText: r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return 'Please Enter Your Email';
                      }
                    },
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    buttonName: 'Reset Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate() ) {
                        context.read<AuthCubit>().forgotPassword(controller.text);
                      }
                    },
                  ),
                  ForgetPasswordBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
