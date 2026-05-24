import 'package:doctor_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../auth/presentation/controller/auth_cubit.dart';
import '../../../../auth/presentation/controller/auth_state.dart';


class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is GetUserDataSuccess) {
          final userData = state.userEntity;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userData.name  ,
                style: AppTextStyle.styleSemiBold18(
                    ColorManager.blackColor, context),
              ),
              verticalSpace(10),
              Text(
                userData.email  ,
                style: AppTextStyle.styleMedium14(
                    ColorManager.grey100, context),
              ),
            ],
          );
        }
        if (state is GetUserDataFailure) {
          return Center(child: Text(state.message));
        }
        return SizedBox.shrink();
      },
    );
  }
}
