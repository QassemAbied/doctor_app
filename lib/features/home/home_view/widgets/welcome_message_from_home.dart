import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/dependey.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../../../profile/logic/profile_state.dart';

class WelcomeMessagesFromHome extends StatelessWidget {
  const WelcomeMessagesFromHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocProvider(
          create: (context) => getIt<ProfileCubit>()..emitProfile(),

          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () {
                    return Center(child: CircularProgressIndicator());
                  },
                  success: (profileResponse) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ${profileResponse.data?[0].name}!',
                          style: AppStyles.styleBold18(
                            ColorManager.blackColor,
                            context,
                          ),
                        ),
                        verticalSpace(7),
                        Text(
                          'How Are you Today?',
                          style: AppStyles.styleRegular12(
                            ColorManager.geryColor,
                            context,
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error) {
                    return Center(child: Text(error));
                  },
                  orElse: () {
                    return SizedBox.shrink();
                  });
            },
          ),
        ),
        Expanded(child: SizedBox()),
        SvgPicture.asset('assets/svgs/notification.svg'),
      ],
    );
  }
}
