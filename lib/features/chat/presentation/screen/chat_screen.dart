import 'package:doctor_app/features/chat/presentation/screen/widget/create_action_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/common_widgets/custom_text_filed.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../domain/entities/message_entity.dart';
import '../controller/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String doctorName;

  const ChatScreen({
    super.key,
    required this.receiverId,
    required this.doctorName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUserId = Supabase.instance.client.auth.currentUser!.id;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text(widget.doctorName), verticalSpace(2), Text('Online')],
        ),

        actions: [
          CreateActionIconWidget(
            iconData: Icons.video_camera_back,
            onTap: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          verticalSpace(12),
          Text(
            'Session Start',

            style: AppTextStyle.styleSemiBold16(
              ColorManager.textSecondary,
              context,
            ),
          ),
          verticalSpace(20),
          Expanded(
            child: StreamBuilder<List<MessageEntity>>(
              stream: context.read<ChatCubit>().getMessages(widget.receiverId),

              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!;

                if (messages.isEmpty) {
                  return Center(
                    child: Text(
                      'No Messages Yet',

                      style: AppTextStyle.styleRegular14(
                        ColorManager.textSecondary,
                        context,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  reverse: true,

                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  itemCount: messages.length,

                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.senderId == currentUserId;

                    if (isMe) {
                      return SenderMessage(
                        message: message.message ?? '',
                        time: DateFormat('hh:mm a').format(message.createdAt),
                      );
                    }

                    return ReceiverMessage(
                      message: message.message ?? '',
                      time: DateFormat('hh:mm a').format(message.createdAt),
                    );
                  },
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

            decoration: BoxDecoration(
              color: ColorManager.whiteColor,

              boxShadow: [
                BoxShadow(
                  color: ColorManager.blackColor.withValues(alpha: .03),
                  blurRadius: 10,
                ),
              ],
            ),

            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: controller,

                          hintText: 'Type a message ...',

                          validator: (_) {},

                          enabled: true,
                        ),
                      ),

                      const Icon(Icons.attach_file, color: ColorManager.grey60),
                      horizontalSpace(10),
                      IconButton(onPressed: (){}, icon: Icon(
                        Icons.camera_alt_outlined,
                        color: ColorManager.grey60,
                      )),
                    ],
                  ),
                ),
                horizontalSpace(14),
                GestureDetector(
                  onTap: () async {
                    if (controller.text.trim().isEmpty) {
                      return;
                    }

                    await context.read<ChatCubit>().sendMessage(
                      receiverId: widget.receiverId,
                      message: controller.text,
                    );

                    controller.clear();
                  },

                  child: Container(
                    width: 50,
                    height: 50,

                    decoration: const BoxDecoration(
                      color: ColorManager.primaryColor,

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.send,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SenderMessage extends StatelessWidget {
  final String message;
  final String time;

  const SenderMessage({super.key, required this.message, required this.time});

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

            child: Text(
              message,

              style: AppTextStyle.styleRegular14(
                ColorManager.whiteColor,
                context,
              ).copyWith(height: 1.5),
            ),
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

class ReceiverMessage extends StatelessWidget {
  final String message;
  final String time;

  const ReceiverMessage({super.key, required this.message, required this.time});

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

            child: Text(
              message,

              style: AppTextStyle.styleRegular14(
                ColorManager.blackColor,
                context,
              ).copyWith(height: 1.5),
            ),
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
