import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/common_widgets/custom_image_or_name_widget.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class ChatItem extends StatelessWidget {
  final String name;

  final String message;

  final String image;

  final String time;
  final bool isShowTime;

  const ChatItem({
    super.key,

    required this.name,

    required this.message,

    required this.image,

    required this.time,
    this.isShowTime = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomImageOrNameWidget(image: image, name: name,),
        horizontalSpace(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,

                      style: AppTextStyle.styleSemiBold16(
                        ColorManager.textPrimary,

                        context,
                      ),
                    ),
                  ),

                  isShowTime
                      ? Text(
                          DateFormat('hh:mm a').format(DateTime.parse(time)),

                          style: AppTextStyle.styleRegular12(
                            ColorManager.textSecondary,

                            context,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              verticalSpace(8),
              Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.styleRegular13(
                  ColorManager.textSecondary,
                  context,
                ).copyWith(height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
