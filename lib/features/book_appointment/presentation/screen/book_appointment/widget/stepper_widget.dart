import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../controller/book_appointment_cubit.dart';
import '../../../controller/book_appointment_state.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();
        final index = cubit.index;
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            stepperContainerWidget(
              () {
                cubit.selectTapBar(0);
              },
              '1',
              index == 0 || index == 1 || index == 2,
              context: context,
            ),

            horizontalSpace(15),
            buildDivider(index == 1 || index == 2),
            horizontalSpace(15),
            stepperContainerWidget(
              () {
                cubit.selectTapBar(1);
              },
              '2',
              index == 1 || index == 2,
              context: context,
            ),
            horizontalSpace(15),
            buildDivider(index == 2),
            horizontalSpace(5),
            state is StripeAppointmentSuccess
                ? stepperContainerWidget(
                    () {
                      cubit.selectTapBar(2);
                    },
                    '3',
                    index == 2,
                    context: context,
                  )
                : stepperContainerWidget(
                    () {},
                    '3',
                    index == 2,
                    context: context,
                  ),
          ],
        );
      },
    );
  }
}

Widget stepperContainerWidget(
  VoidCallback onTap,
  String title,
  bool step, {
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: step ? ColorManager.primary80 : ColorManager.grey40,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.styleMedium14(ColorManager.whiteColor, context),
        ),
      ),
    ),
  );
}

Widget buildDivider(bool number) => Expanded(
  child: Divider(
    color: number ? ColorManager.primaryColor : ColorManager.grey40,
    height: 3,
  ),
);
