import 'package:doctor_app/core/common_widgets/custom_elevated_botton.dart';
import 'package:doctor_app/core/utils/eunm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_svgs.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../controller/book_appointment_cubit.dart';
import '../../../controller/book_appointment_state.dart';
import '../../shared_widget/custom_texts_appointment.dart';

class AppointmentPayments extends StatelessWidget {
  const AppointmentPayments({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookAppointmentCubit>();
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  buildText('Payment Option', context),
                  verticalSpace(20),
                  paymentWidget(
                    context: context,
                    value: CardType.credit,
                    groupValue: cubit.cardType,
                    onchange: () {
                      cubit.selectPayment(CardType.credit);
                    },
                    title: 'Credit Card',
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),

                    curve: Curves.easeInOut,

                    child: cubit.cardType == CardType.credit
                        ? buildCreditPayment(context)
                        : const SizedBox(),
                  ),

                  verticalSpace(20),
                  paymentWidget(
                    context: context,
                    value: CardType.bank,
                    groupValue: cubit.cardType,
                    onchange: () {
                      cubit.selectPayment(CardType.bank);
                    },
                    title: 'Bank Transfer',
                  ),
                  verticalSpace(20),
                  paymentWidget(
                    context: context,
                    value: CardType.paypal,
                    groupValue: cubit.cardType,
                    onchange: () {
                      cubit.selectPayment(CardType.paypal);
                    },
                    title: 'Paypal',
                  ),

                  verticalSpace(20),
                  CustomElevatedButton(
                    buttonName: 'Continue',
                    onPressed: () {
                      cubit.selectTapBar(2);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Column buildCreditPayment(BuildContext context) {
    return Column(
      children: [
        verticalSpace(10),
        buildSubPayments(context, AppSvgs.mastercard, 'Master Card'),
        verticalSpace(20),
        buildSubPayments(context, AppSvgs.group4778, 'American Express'),
        verticalSpace(20),
        buildSubPayments(context, AppSvgs.group4780, 'Capital One'),
        verticalSpace(20),
        buildSubPayments(context, AppSvgs.group4781, 'Barclays'),
      ],
    );
  }

  Widget buildSubPayments(
    BuildContext context,

    String images,

    String subTitle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),

      child: Row(
        children: [
          SvgPicture.asset(images),
          horizontalSpace(20),
          Text(
            subTitle,
            style: AppTextStyle.styleMedium14(
              ColorManager.textPrimary,
              context,
            ),
          ),
        ],
      ),
    );
  }

  RadioMenuButton<dynamic> paymentWidget({
    required BuildContext context,
    required var value,
    required var groupValue,
    required VoidCallback onchange,
    required String title,
    List<Widget>? child,
  }) {
    return RadioMenuButton(
      value: value,
      groupValue: groupValue,
      onChanged: (_) => onchange(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.styleSemiBold16(
              ColorManager.blackColor,
              context,
            ),
          ),
        ],
      ),
    );
  }
}
