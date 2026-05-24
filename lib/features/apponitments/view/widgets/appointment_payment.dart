import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class AppointmentPayments extends StatefulWidget {
  const AppointmentPayments({super.key});

  @override
  State<AppointmentPayments> createState() => _AppointmentPaymentsState();
}
enum AppointmentsPayment { creditCard, bankTransfer, paypal }

class _AppointmentPaymentsState extends State<AppointmentPayments> {
  AppointmentsPayment selectedPayment = AppointmentsPayment.creditCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20),
        Text(
          'Payment Option',
          style: AppTextStyle.styleSemiBold16(
            ColorManager.blackColor,
            context,
          ),
        ),
        verticalSpace(20),
        paymentWidget(
          context: context,
          value: AppointmentsPayment.creditCard,
          groupValue: selectedPayment,
          onchange: () {
            setState(() {
              selectedPayment = AppointmentsPayment.creditCard;
            });
          },
          title: 'Credit Card',
          child: [
            buildSubPayments(
              context,
              'assets/svgs/mastercard.svg',
              'Master Card',
            ),
            buildSubPayments(
              context,
              'assets/svgs/Group1000004778.svg',
              'American Express',
            ),
            buildSubPayments(
              context,
              'assets/svgs/Group 1000004780.svg',
              'Capital One',
            ),
            buildSubPayments(
              context,
              'assets/svgs/Group 1000004781.svg',
              'Barclays',
            ),
          ],
        ),

        verticalSpace(20),
        paymentWidget(
            context: context,
            value: AppointmentsPayment.bankTransfer,
            groupValue: selectedPayment,
            onchange: () {
              setState(() {
                selectedPayment = AppointmentsPayment.bankTransfer;
              });
            },
            title: 'Bank Transfer'
        ),
        verticalSpace(20),
        paymentWidget(
            context: context,
            value: AppointmentsPayment.paypal,
            groupValue: selectedPayment,
            onchange: () {
              setState(() {
                selectedPayment = AppointmentsPayment.paypal;
              });
            },
            title: 'Paypal'
        ),
      ],
    );
  }

  Column buildSubPayments(BuildContext context ,String images, String subTitle) {
    return Column(
     // crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        verticalSpace(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SvgPicture.asset(images),
            horizontalSpace(20),
            Text(
              subTitle,
              style: AppTextStyle.styleMedium14(ColorManager.blackColor, context),
            ),


          ],

        ),
        verticalSpace(20),
        Divider(color: ColorManager.grey80,),
      ],
    );
  }

  Row paymentWidget({
    required BuildContext context,
    required var value,
    required var groupValue,
    required VoidCallback onchange,
    required String title,
    List<Widget>? child,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            radioTheme: RadioThemeData(
              fillColor: WidgetStateProperty.all(ColorManager.primaryColor),
              overlayColor: WidgetStateProperty.all(ColorManager.primaryColor),
            ),
          ),
          child: RadioMenuButton(
            value: value,
            groupValue: groupValue,
            onChanged: (_) => onchange(),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.styleSemiBold16(ColorManager.blackColor, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: child??[],
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}