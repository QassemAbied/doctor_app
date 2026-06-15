import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entities/message_entity.dart';
import 'message_content_widget.dart';

class ReceiverMessageWidget extends StatelessWidget {
  final MessageEntity message;
  final String time;

  const ReceiverMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: ColorManager.grey40,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MessageContentWidget(message: message, isSender: false),
          ),

          Text(
            time,
            style: AppTextStyle.styleRegular13(
              ColorManager.textSecondary,
              context,
            ),
          ),

          verticalSpace(18),
        ],
      ),
    );
  }
}
