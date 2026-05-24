import 'package:flutter/material.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../data/models/my_appointment_response.dart';
import 'all_button.dart';

class ItemListMyAppointments extends StatelessWidget {
  const ItemListMyAppointments({super.key, required this.appointments});

  final Data? appointments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Image.asset('assets/images/doctor_image.png')),
            horizontalSpace(20),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointments?.doctor?.name ?? '',
                    style: AppTextStyle.styleBold16(
                      ColorManager.blackColor,
                      context,
                    ),
                  ),
                  verticalSpace(5),
                  Text(
                    '${appointments?.doctor?.specialization?.name} | ${appointments?.doctor?.description}',
                    style: AppTextStyle.styleMedium14(
                      ColorManager.grey80,
                      context,
                    ),
                  ),
                  verticalSpace(5),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      appointments?.appointmentTime ?? '',
                      style: AppTextStyle.styleMedium14(
                        ColorManager.grey80,
                        context,
                      ),
                    ),
                  ),

                  verticalSpace(5),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Divider(),
        verticalSpace(8),
        AllButtonInMyAppointments(),
        verticalSpace(30),
      ],
    );
  }
}
