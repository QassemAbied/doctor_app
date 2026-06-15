import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_color.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../domain/entities/message_entity.dart';
import 'message_content_widget.dart';

class SenderMessageWidget extends StatelessWidget {
  final MessageEntity message;
  final String time;

  const SenderMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: const BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: MessageContentWidget(message: message, isSender: true),
          ),

          Text(
            time,
            style: AppTextStyle.styleRegular13(
              ColorManager.textSecondary,
              context,
            ),
          ),

          verticalSpace(10),
        ],
      ),
    );
  }
}
