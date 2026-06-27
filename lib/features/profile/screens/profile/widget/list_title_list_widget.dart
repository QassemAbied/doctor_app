import 'package:doctor_app/core/constants/app_svgs.dart';
import 'package:doctor_app/core/theming/app_color.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:doctor_app/features/auth/presentation/controller/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common_widgets/dialog/custom_dialog_widget.dart';
import '../../../../../core/utils/app_router/routes.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../notification/presentation/screen/notification_screen.dart';
import 'list_title_widget.dart';

class ListTitleListWidget extends StatelessWidget {
  const ListTitleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is GetUserDataSuccess) {
              return ListTitleWidget(
                image: 'assets/svgs/personal_icon.svg',
                text: 'Personal Information',
                onTap: () {
                  context.pushNamed(
                    Routes.updateProfileScreen,
                    arguments: state.userEntity,
                  );
                },
              );
            }
            return ListTitleWidget(
              image: 'assets/svgs/personal_icon.svg',
              text: 'Personal Information',
              onTap: () {},
            );
          },
        ),
        verticalSpace(10),
        Divider(color: ColorManager.grey20, height: 1),
        verticalSpace(10),
        ListTitleWidget(
          image: AppSvgs.myAppointment,
          text: 'Notifications',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationScreen()),
            );
          },
        ),
        verticalSpace(10),
        Divider(color: ColorManager.grey20, height: 1),
        verticalSpace(10),
        ListTitleWidget(
          image: AppSvgs.logout,
          text: 'Logout',
          onTap: () {
            CustomDialogWidget.logOutDialog(context, );
          },
        ),
        verticalSpace(10),
        Divider(color: ColorManager.grey20, height: 1),
        verticalSpace(10),
      ],
    );
  }
}
