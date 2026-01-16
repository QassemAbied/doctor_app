import 'package:doctor_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:doctor_app/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extension.dart';
import '../../../../core/routing/routes.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
            loading: (){
              showDialog(context: context, builder: (context){
                return Center(child: CircularProgressIndicator(),);
              },);
            },
            success: (value){
              context.navigatorPop();
               showSuccessDialog(context);
            },
            error: (value){
              context.navigatorPop();
               showDialog(context: context, builder: (context){
                return AlertDialog(
                  content: Text(value),
                );
              },);
            }
        );
      },
      child: SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.loginScreen, (_)=>false);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}
