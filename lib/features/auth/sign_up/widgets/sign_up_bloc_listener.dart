import 'package:doctor_app/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:doctor_app/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extension.dart';

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
              return context.pushNamed('/home');
            },
            error: (value){
              context.navigatorPop();
              return showDialog(context: context, builder: (context){
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
}
