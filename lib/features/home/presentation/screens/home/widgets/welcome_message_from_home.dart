import 'package:doctor_app/core/constants/app_svgs.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';


class WelcomeMessagesFromHome extends StatelessWidget {
  const WelcomeMessagesFromHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLoading = state is GetUserDataLoading;

            String name = 'Loading...';

            if (state is GetUserDataSuccess) {
              name = state.userEntity.name;
            }

            return Skeletonizer(
              enabled: isLoading,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Hi, $name!',

                    style: AppTextStyle.styleBold18(
                      ColorManager.textPrimary,
                      context,
                    ),
                  ),

                  verticalSpace(7),

                  Text(
                    'How Are you Today?',

                    style: AppTextStyle.styleRegular14(
                      ColorManager.textSecondary,
                      context,
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        const Spacer(),

        SvgPicture.asset(AppSvgs.notification),
      ],
    );
  }
}
